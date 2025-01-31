<?php

require_once __DIR__ . '/Model.php';

class User extends Model
{
  // Atributos
  private $userName;
  private $email;
  private $password;
  private $phone;
  private $role;
  private $image_url;
  

  // Constructor
  public function __construct($userName = null, $email, $password, $phone = null, $role = null, $image_url = "/assets/images/uploads/user-placeholder.webp")
  {
    $this->userName = $userName;
    $this->email = $email;
    $this->password = $password;
    $this->phone = $phone;
    $this->role = $role;
    $this->image_url = $image_url;
  }

  // Getters
  public function getUserName()
  {
    return $this->userName;
  }
  public function getEmail()
  {
    return $this->email;
  }
  public function getPassword()
  {
    return $this->password;
  }

  public function getPhone(){
    return $this->phone;
  }
  public function getRole(){
    return $this->role;
  }
  // Setters

  public function setUserName($userName)
  {
    $this->userName = $userName;
  }
  public function setEmail($email)
  {
    $this->email = $email;
  }
  public function setPassword($password)
  {
    $this->password = $password;
  }
  public function setPhone($phone){
    $this->phone = $phone;
  }
  public function setRole($role){
    $this->role = $role;
  }
  public function setImageUrl($image_url){
    $this->image_url = $image_url;
  }
  public function getImageUrl(){
    return $this->image_url;
  }
}