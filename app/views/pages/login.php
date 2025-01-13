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
  <form action="/login-form" method="POST">
    <label for="email">email:</label>
    <input type="email" id="email" name="email" required>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <button type="submit">Iniciar sesión</button>
    <a href="signup">¿No tienes cuenta? Crea una</a>
  </form>
</body>

</html>