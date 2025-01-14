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
    // Creamos instancia del repositorio de Collection y lo asignamos a la variable de esta instancia de HomeController
    $this->userRepository = new UserRepository();
  }
  public function loginForm()
  {
    $user = new User(null, $this->request->post('email'), $this->request->post('password'));
    $email = $user->getEmail();
    $password = $user->getPassword();

    // Recuperar los datos del usuario por email
    $userRecord = $this->userRepository->checkLogin($email);

    if ($userRecord && password_verify($password, $userRecord['password'])) {
      // Si la contraseña coincide, inicia sesión
      $_SESSION['name'] = $email;
      $this->response->sendRedirect('/myPage');
    } else {
      // Contraseña incorrecta o usuario no encontrado
      var_dump("Login fallido: usuario o contraseña incorrectos.");
      $this->response->sendRedirect('/error');
    }

    return null;
  }

  public function deleteAccount()
  {
    $email = $_SESSION['name'];
    $this->userRepository->deleteUser($email);
    session_destroy();
    $this->response->sendRedirect('/home');
    return null;

  }
  public function editAccount()
  {
    // Obtén el email actual desde la sesión
    $currentEmail = $_SESSION['name'];

    // Crea una instancia de User con los datos del formulario
    $user = new User(
      $this->request->post('username'),
      $this->request->post('email'),
      $this->request->post('password'),
      $this->request->post('phone')
    );

    // Asegúrate de que $user es un objeto válido de la clase User
    if (!($user instanceof User)) {
      throw new InvalidArgumentException('El objeto $user debe ser una instancia válida de la clase User.');
    }

    // Llama al repositorio para actualizar el usuario
    $this->userRepository->updateUser($currentEmail, $user);

    // Actualiza el email en la sesión si fue cambiado
    $_SESSION['name'] = $user->getEmail();

    // Redirige a la página principal o donde sea necesario
    $this->response->sendRedirect('/');
    return null;
  }
  public function logout()
  {
    session_destroy();
    $this->response->sendRedirect('/home');
  }
  public function signUpForm()
  {
    $user = new User($this->request->post('username'), $this->request->post('email'), $this->request->post('password'), $this->request->post('phone'));
    $this->userRepository->saveUser($user);
    $this->response->sendRedirect('/myPage');
    return null;
  }
}
