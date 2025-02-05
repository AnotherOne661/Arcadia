<?php

// Requerimos el repositorio principal
require_once __DIR__ . '/Repository.php';

// Requerimos los modelos necesarios

require_once __DIR__ . '/../models/User.php';

// Extendemos HomeRepository de Repository
class UserRepository extends Repository
{
  public function __construct()
  {
    // Llamamos al constructor padre y, al atributo del padre
    // le damos el atributo que es el nombre de la tabla sobre la que trabajaremos
    parent::__construct();

    $this->tableName = 'users';
  }

  public function checkLogin($email)
  {
    $query = "SELECT username, email, password, `image-url` FROM $this->tableName WHERE email = :email";
    $stmt = $this->pdo->prepare($query);
    var_dump($stmt);
    // Bind parameters
    $stmt->bindParam(':email', $email);

    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    return $row; // Devuelve el registro asociado al email, incluyendo el hash de la contraseña
  }
  public function saveUser($usuario)
  {
    // Implementación para guardar un nuevo usuario en la base de datos
    //var_dump($usuario);
    $emailCorrect = false;
    $email = $usuario->getEmail();

    $username = $usuario->getUsername();

    $password = password_hash($usuario->getPassword(), PASSWORD_DEFAULT);
    $passwordCorrect = false;
    $passwordRegex = "/^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/";

    $phone = $usuario->getPhone();
    $phoneCorrect = false;
    $phoneRegex = "/^(\+34|0034|34)?[6789]\d{8}$/";

    $usrExists = true;

    if (preg_match($phoneRegex, $phone)) {
      $phoneCorrect = true;
    }
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $emailCorrect = true;
    }
    if (preg_match($passwordRegex, $usuario->getPassword())) {
      $passwordCorrect = true;
    }

    $user = $this->checkLogin($email);
    if (!$user) {
      $usrExists = false; // User exists
    }

    $usrImg = $usuario->getImageUrl();
    if ($usuario->getRole() != null) {
      $role = '1';
    } else {
      $role = '0';
    }

    if ($phoneCorrect && $emailCorrect && $passwordCorrect) {
      if (!$usrExists) {
        $_SESSION['signup_error'] = null;

        $query = "INSERT INTO $this->tableName (email, username, password, phone, role,`image-url`) VALUES (:email, :username, :password, :phone, :role, :imageurl)";
        $stmt = $this->pdo->prepare($query);

        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':role', $role);
        $stmt->bindParam(':imageurl', $usrImg);
        $_SESSION['name'] = $username;
        $_SESSION['profile-path'] = null;
        $stmt->execute();
      } else {
        echo "Error: El usuario ya existe.\n";
        $_SESSION['signup_error'] = "El usuario ya existe.\n";
      }


    } else {
      echo "Error: Los datos introducidos no son válidos.\n";
      echo "Error: Tu email debe tener un formato válido.\n";
      echo "Error: Tu contraseña debe tener al menos una letra mayúscula, un número y un carácter especial.\n";
      echo "Error: Tu teléfono debe tener un formato válido.\n";
    }

  }
  public function deleteUser($email)
  {
    $query = "DELETE FROM $this->tableName WHERE email = :email";
    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
  }
  public function updateUser($currentEmail, $user, $image)
{
    // Verificar si el parámetro $user es una instancia de la clase User
    if (!($user instanceof User)) {
        throw new InvalidArgumentException('El parámetro $user debe ser una instancia de la clase User.');
    }

    $currentEmail = trim($currentEmail);

    // Verificar si el email realmente existe en la base de datos
    $count = $this->checkIfExist($currentEmail);
    if ($count == 0) {
        echo "Error: No se encontró el email en la base de datos.\n";
        return;
    }

    // Validación de email
    $newEmail = trim($user->getEmail());
    if (!filter_var($newEmail, FILTER_VALIDATE_EMAIL)) {
        echo "Error: El formato del email es inválido.\n";
        return;
    }

    // Verificar si el nuevo email ya está en uso, pero no si es el mismo que el actual
    $adequate = $this->checkIfExist($newEmail);
    if ($adequate > 0 && $newEmail != $currentEmail) {
        echo "Error: Este email ya está en uso.\n";
        $_SESSION['signup_error_duplicate'] = "Este email ya está en uso.\n";
        return;
    }

    // Validación de la contraseña
    $password = $user->getPassword();
    $passwordCorrect = false;
    $passwordRegex = "/^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/";
    if (preg_match($passwordRegex, $password)) {
        $passwordCorrect = true;
    }

    if (!$passwordCorrect) {
        echo "Error: Tu contraseña debe tener al menos una letra mayúscula, un número y un carácter especial.\n";
        return;
    }

    // Validación del teléfono
    $phone = $user->getPhone();
    $phoneCorrect = false;
    $phoneRegex = "/^(\+34|0034|34)?[6789]\d{8}$/";
    if (preg_match($phoneRegex, $phone)) {
        $phoneCorrect = true;
    }

    if (!$phoneCorrect) {
        echo "Error: Tu teléfono debe tener un formato válido.\n";
        return;
    }

    // Directorio donde se almacenarán las imágenes
    $uploadDir = 'uploads/';

    // Verificar si el directorio existe, si no, crearlo
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $username = $user->getUsername();
    $password = password_hash($password, PASSWORD_DEFAULT);

    $newImageUrl = null;
    $newFileName = null;
    $uploadedFile = $image;

    // Manejo de la imagen subida
    if ($uploadedFile && isset($uploadedFile['tmp_name']) && $uploadedFile['error'] === UPLOAD_ERR_OK) {
        // Obtener extensión y generar nombre único
        $ext = pathinfo($uploadedFile['name'], PATHINFO_EXTENSION);
        $newFileName = uniqid() . "." . $ext;
        $destination = __DIR__ . "/../../public/assets/images/$uploadDir" . $newFileName;

        // Verificar si `move_uploaded_file()` funciona correctamente
        if (move_uploaded_file($uploadedFile['tmp_name'], $destination)) {
            $newImageUrl = $destination;
        } else {
            echo "Error al mover el archivo.";
            var_dump(error_get_last());
            return;
        }
    }

    // Construir la consulta SQL dinámicamente
    $query = "UPDATE $this->tableName 
              SET username = :username, password = :password, phone = :phone";

    if ($newFileName !== null) {
        $query .= ", `image-url` = :newImageUrl";
    }

    $query .= " WHERE LOWER(email) = LOWER(:currentEmail)";

    // Preparar la consulta
    $stmt = $this->pdo->prepare($query);
    $stmt->bindValue(':username', $username, PDO::PARAM_STR);
    $stmt->bindValue(':password', $password, PDO::PARAM_STR);
    $stmt->bindValue(':phone', $phone, PDO::PARAM_STR);
    $stmt->bindValue(':currentEmail', $currentEmail, PDO::PARAM_STR);

    if ($newImageUrl !== null) {
        $stmt->bindValue(':newImageUrl', $uploadDir . $newFileName, PDO::PARAM_STR);
    }

    // Ejecutar consulta
    $stmt->execute();

    if ($stmt->rowCount() === 0) {
        echo "No se realizaron cambios. Puede que los datos sean los mismos o el email no coincida exactamente.\n";
    }

    // Si el email ha cambiado, actualizarlo en una consulta separada
    if ($newEmail !== $currentEmail) {
        $queryEmail = "UPDATE $this->tableName SET email = :newEmail WHERE LOWER(email) = LOWER(:currentEmail)";
        $stmtEmail = $this->pdo->prepare($queryEmail);
        $stmtEmail->bindValue(':newEmail', $newEmail, PDO::PARAM_STR);
        $stmtEmail->bindValue(':currentEmail', $currentEmail, PDO::PARAM_STR);

        $stmtEmail->execute();

        if ($stmtEmail->rowCount() === 0) {
            echo "Error al actualizar el email. Verifica que el nuevo email sea diferente.\n";
        }
    }

    // Actualizar sesión
    $_SESSION['email'] = $newEmail;
    $newPath = "/assets/images/$uploadDir" . $newFileName;
    $_SESSION['profile-path'] = $newPath;
}
  private function checkIfExist($email)
  {
    $checkQuery = "SELECT COUNT(*) FROM $this->tableName WHERE email = :currentEmail";
    $checkStmt = $this->pdo->prepare($checkQuery);
    $checkStmt->bindValue(':currentEmail', $email, PDO::PARAM_STR);
    $checkStmt->execute();
    $count = $checkStmt->fetchColumn();

    return $count;
  }
}
