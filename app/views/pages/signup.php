<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/assets/styles/login.css">
  <title>Login</title>
</head>


<body>
  <a href="/">Ir atrás</a>

  <form action="/signup-form" method="POST">
    <label for="username">Nombre de usuario: </label>
    <input type="text" name="username" placeholder="Jace, the mind sculptor" required>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" placeholder="ejemplo@email.com" required>
    <label for="password">Contraseña:</label>
    <input type="password" id="password" name="password" required>
    <label for="confirmPassword">Confirmar contraseña:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>
    <label for="phone">Introduce tu número de teléfono:</label>
    <input type="tel" name="phone" required placeholder="661695045">
    <label for="terms">Soy mayor de edad:</label>
    <input type="checkbox" id="age" name="age" required>
    <label for="terms">Aceptar términos y condiciones:</label>
    <input type="checkbox" id="terms" name="terms" required>
    <button type="submit">Crear cuenta</button>
  </form>
</body>

</html>