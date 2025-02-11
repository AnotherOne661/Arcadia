<body>

  <form action="/login-form" method="POST" id="form_login">
    <?php
    if (isset($_SESSION['login_error'])) {
      echo '<p class="error" style="text-align: center;"> El email o la contraseña introducidos no son los correctos</p>';
      unset($_SESSION['login_error']);
    }
    ?>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" placeholder="chandralovesgurls@mtg.com" required>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <button type="submit">Iniciar sesión</button>
    <a href="signup">¿No tienes cuenta? Crea una</a>
  </form>
</body>