<main>
    <form action="/signup-form" method="POST" class="form_signup">
      <label for="username">Nombre de usuario: </label>
      <input type="text" name="username" placeholder="Jace, the mind sculptor" required>
      <label for="email">Email:</label>
      <input type="text" id="email" name="email" placeholder="everybody@hatesme.com" required>
      <label for="password">Contraseña:</label>
      <input type="password" id="password" name="password" required>
      <label for="confirmPassword">Confirmar contraseña:</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required>
      <label for="phone">Introduce tu número de teléfono:</label>
      <input type="tel" name="phone" required placeholder="661695045">
      <div class="form-checkboxes">
        <label for="terms">Soy mayor de edad:</label>
        <input type="checkbox" id="age" name="age" required>
        <label for="terms">Aceptar términos y condiciones:</label>
        <input type="checkbox" id="terms" name="terms" required>
      </div>

      <button type="submit">Crear cuenta</button>
    </form>
  </main>
