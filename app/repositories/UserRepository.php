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
  public function saveUser($usuario){
    // Implementación para guardar un nuevo usuario en la base de datos
    //var_dump($usuario);
    $email = $usuario->getEmail();
    $username = $usuario->getUsername();
    $password = password_hash($usuario->getPassword(), PASSWORD_DEFAULT);
    $phone = $usuario->getPhone();
    $usrImg = $usuario->getImageUrl();
    if ($usuario->getRole() != null){
      $role = '1';
    } else{
      $role = '0';
    }


    $query = "INSERT INTO $this->tableName (email, username, password, phone, role,`image-url`) VALUES (:email, :username, :password, :phone, :role, :imageurl)";
    $stmt = $this->pdo->prepare($query);

    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $password);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':role', $role);
    $stmt->bindParam(':imageurl', $usrImg);

    $stmt->execute();
  }
  public function deleteUser($email){
    $query = "DELETE FROM $this->tableName WHERE email = :email";
    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
  }
  public function updateUser($currentEmail, $user, $image)
{
    // Debugging Emails
    var_dump($currentEmail);
    var_dump($user->getEmail());

    if (!($user instanceof User)) {
        throw new InvalidArgumentException('El parámetro $user debe ser una instancia de la clase User.');
    }

    $currentEmail = trim($currentEmail);

    // Verificar si el email realmente existe en la base de datos
    $checkQuery = "SELECT COUNT(*) FROM $this->tableName WHERE email = :currentEmail";
    $checkStmt = $this->pdo->prepare($checkQuery);
    $checkStmt->bindValue(':currentEmail', $currentEmail, PDO::PARAM_STR);
    $checkStmt->execute();
    $count = $checkStmt->fetchColumn();

    if ($count == 0) {
        echo "Error: No se encontró el email en la base de datos.\n";
        return;
    }

    // Directorio donde se almacenarán las imágenes
    $uploadDir = '/uploads/';

    // Verificar si el directorio existe, si no, crearlo
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    // Extraer los datos del objeto User
    $newEmail = trim($user->getEmail());
    $username = $user->getUsername();
    $password = password_hash($user->getPassword(), PASSWORD_DEFAULT);
    $phone = $user->getPhone();
    
    $newImageUrl = null;
    $uploadedFile = $image;

    // Manejo de la imagen subida
    if ($uploadedFile && isset($uploadedFile['tmp_name']) && $uploadedFile['error'] === UPLOAD_ERR_OK) {
        // Obtener extensión y generar nombre único
        $ext = pathinfo($uploadedFile['name'], PATHINFO_EXTENSION);
        $newFileName = uniqid() . "." . $ext;
        $destination = $uploadDir . $newFileName;

        // Debugging
        echo "Intentando subir archivo a: " . realpath($uploadDir) . "/$newFileName \n";

        // Verificar si `move_uploaded_file()` funciona correctamente
        if (move_uploaded_file($uploadedFile['tmp_name'], $destination)) {
            echo "Archivo subido correctamente a: " . $destination . "\n";
            $newImageUrl = $destination;
        } else {
            echo "Error al mover el archivo.";
            var_dump(error_get_last());
            return;
        }
    } else {
        echo "No se recibió archivo o hubo un error en la subida.";
        var_dump($uploadedFile);
    }

    // Construir la consulta SQL dinámicamente
    $query = "UPDATE $this->tableName 
              SET username = :username, password = :password, phone = :phone";

    if ($newImageUrl !== null) {
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
        $stmt->bindValue(':newImageUrl', $newImageUrl, PDO::PARAM_STR);
    }

    // Debug SQL Query
    $stmt->debugDumpParams();

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
        
        // Debug SQL Query
        $stmtEmail->debugDumpParams();

        $stmtEmail->execute();
        
        if ($stmtEmail->rowCount() === 0) {
            echo "Error al actualizar el email. Verifica que el nuevo email sea diferente.\n";
        }
    }

    // Actualizar sesión
    $_SESSION['email'] = $newEmail;
}
}
