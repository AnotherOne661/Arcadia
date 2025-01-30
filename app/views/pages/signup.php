<main>
    <form action="/signup-form" method="POST" id="registration-form">
      <label for="username">Nombre de usuario: </label>
      <input type="text" name="username" placeholder="Jace, the mind sculptor" >
      <label for="email">Email:</label>
      <input type="text" id="email" name="email" placeholder="everybody@hatesme.com" >
      <label for="password">Contraseña:</label>
      <input type="password" id="password" name="password" >
      <label for="confirmPassword">Confirmar contraseña:</label>
      <input type="password" id="confirmPassword" name="confirmPassword" >
      <label for="phone">Introduce tu número de teléfono:</label>
      <input type="tel" name="phone"  placeholder="661695045">
      <div class="form-checkboxes">
        <label for="terms">Soy mayor de edad:</label>
        <input type="checkbox" id="age" name="age" >
        <label for="terms">Aceptar términos y condiciones:</label>
        <input type="checkbox" id="terms" name="terms" >
      </div>

      <button type="submit">Crear cuenta</button>
    </form>
  </main>
