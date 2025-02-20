<?php

// Requerimos primero el controlador principal
require_once __DIR__ . '/Controller.php';
// Luego las respuestas y peticiones
require_once __DIR__ . '/../core/http/Request.php';
require_once __DIR__ . '/../core/http/Response.php';
// Finalmente requerimos el respositorio sobre el que haremos las búsquedas dinámicas
require_once __DIR__ . '/../repositories/UserRepository.php';

class UserController extends Controller
{
  private $userRepository;

  public function __construct($request, $response)
  {
    // Llamamos al constructor del padre para inicializar las propiedades del controlador
    parent::__construct($request, $response);
    // Creamos instancia del repositorio de User y lo asignamos a la variable de esta instancia de UserRepository
    $this->userRepository = new UserRepository();
  }
  // Método que renderiza la vista login, también es donde ejecutaremos las querys dinámicas
  public function loginForm()
  {
    $user = new User(null, $this->request->post('email'), $this->request->post('password'));
    $email = $user->getEmail();
    $password = $user->getPassword();
    // Recuperar los datos del usuario por email
    $userRecord = $this->userRepository->checkLogin($email);

    $usrImg = $userRecord['image-url'];
    $usrNick = $userRecord['username'];
    if ($userRecord && password_verify($password, $userRecord['password'])) {
      // Si la contraseña coincide, inicia sesión y establece las variables de sesión pertinentes
      $_SESSION['name'] = $usrNick;
      $_SESSION['email'] = $email;
      $_SESSION['profile'] = ltrim($usrImg, '/');
      $_SESSION['profile-path'] = "/assets/images/" . $_SESSION['profile'];

      $this->response->sendRedirect('/mypage');
    } else {
      // Contraseña incorrecta o usuario no encontrado
      var_dump("Login fallido: usuario o contraseña incorrectos.");
      // Establecemos el error de login en la sesión y redirigimos a login de nuevo
      $_SESSION['login_error'] = true;
      $this->response->sendRedirect('/login');
    }

    return null;
  }
  // función para borrar la cuenta
  public function deleteAccount()
  {
    try {
      // Obtenemos el email de la sesión y lo pasamos al método de borrado
      $email = $_SESSION['email'];
      $this->userRepository->deleteUser($email);
      session_destroy();
      $this->response->sendRedirect('/home');
      return null;
    } catch (PDOException $e) {
      echo "Error al borrar la cuenta: " . $e->getMessage();
    }

  }
  // función para editar la cuenta
  public function editAccount()
  {
    // Obtén el email actual desde la sesión
    $currentEmail = $_SESSION['email'];
    $uploadedFile = $_FILES['imageurl'] ?? null;
    // Crea una instancia de User con los datos del formulario
    $user = new User(
      $this->request->post('username'),
      $this->request->post('email'),
      $this->request->post('password'),
      $this->request->post('phone'),
      0
    );

    // Se asegura de que $user es un objeto válido de la clase User
    if (!($user instanceof User)) {
      throw new InvalidArgumentException('El objeto $user debe ser una instancia válida de la clase User.');
    }
    // Llama al repositorio para actualizar el usuario
    $this->userRepository->updateUser($currentEmail, $user, $uploadedFile);

    // Actualiza el email en la sesión si fue cambiado
    $_SESSION['name'] = $user->getUserName();
    // Redirige a la página principal o donde sea necesario
    $this->response->sendRedirect('/');
    return null;
  }
  // función para cerrar la sesión
  public function logout()
  {
    session_destroy();
    $this->response->sendRedirect('/home');
  }

  // función para registrar un nuevo usuario
  public function signUpForm()
  {
    $user = new User($this->request->post('username'), $this->request->post('email'), $this->request->post('password'), $this->request->post('phone'));
    $this->userRepository->saveUser($user);
    // Si el registro es exitoso, elimina el error de registro de la sesión y redirige a la página principal
    if ($_SESSION['signup_error']) {
      echo "Error al crear cuenta: " . $_SESSION['signup_error'];
      $this->response->sendRedirect("/signup");
    } else {
      echo "no hay error";
      $this->response->sendRedirect('/mypage');
    }
    return null;
  }
}
