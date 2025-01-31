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
      $query = "SELECT email, password, image-url FROM $this->tableName WHERE email = :email";
      $stmt = $this->pdo->prepare($query);
  
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
    if ($usuario->getRole() != null){
      $role = '1';
    } else{
      $role = '0';
    }


    $query = "INSERT INTO $this->tableName (email, username, password, phone, role) VALUES (:email, :username, :password, :phone, :role)";
    $stmt = $this->pdo->prepare($query);

    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $password);
    $stmt->bindParam(':phone', $phone);
    $stmt->bindParam(':role', $role);

    $stmt->execute();
  }
  public function deleteUser($email){
    $query = "DELETE FROM $this->tableName WHERE email = :email";
    $stmt = $this->pdo->prepare($query);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
  }
  public function updateUser($currentEmail, $user)
  {
      // Verificar que $user sea un objeto de tipo User
      if (!($user instanceof User)) {
          throw new InvalidArgumentException('El parámetro $user debe ser una instancia de la clase User.');
      }
  
      // Extraer los datos del objeto User
      $newEmail = $user->getEmail();
      $newImageUrl = $user->getImageUrl();
      $username = $user->getUsername();
      $password = password_hash($user->getPassword(), PASSWORD_DEFAULT); // Rehashear la contraseña
      $phone = $user->getPhone();
  
      // Construir la consulta SQL
      $query = "UPDATE $this->tableName 
                SET email = :newEmail, username = :username, password = :password, phone = :phone 
                image-url = :newImageUrl WHERE email = :currentEmail";
  
      // Preparar y ejecutar la consulta
      $stmt = $this->pdo->prepare($query);
      $stmt->bindParam(':newEmail', $newEmail);
      $stmt->bindParam(':username', $username);
      $stmt->bindParam(':password', $password);
      $stmt->bindParam(':phone', $phone);
      $stmt->bindParam(':currentEmail', $currentEmail);
      $stmt->bindParam(':newImageUrl', $newImageUrl);
  
      $stmt->execute();
  }
}
