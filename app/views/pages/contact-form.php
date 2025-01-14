<main>
  <section class="contact-form-section">
    <h1>Contáctanos</h1>
    <p>¿Tienes alguna pregunta, comentario o sugerencia? Estamos aquí para ayudarte. Por favor, completa el siguiente
      formulario y nos pondremos en contacto contigo lo antes posible.</p>

    <form action="/send-message" method="POST" class="contact-form">
      <!-- Nombre -->
      <label for="name">Nombre completo:</label>
      <input type="text" id="name" name="name" placeholder="Escribe tu nombre" required>

      <!-- Correo Electrónico -->
      <label for="email">Correo electrónico:</label>
      <input type="email" id="email" name="email" placeholder="Escribe tu correo electrónico" required>

      <!-- Asunto -->
      <label for="subject">Asunto:</label>
      <input type="text" id="subject" name="subject" placeholder="¿Sobre qué quieres hablarnos?" required>

      <!-- Mensaje -->
      <label for="message">Mensaje:</label>
      <textarea id="message" name="message" placeholder="Escribe tu mensaje aquí..." rows="6" required></textarea>

      <!-- Botón de Enviar -->
      <button type="submit">Enviar Mensaje</button>
    </form>
  </section>

  <!-- Información de Contacto Alternativa -->
  <section class="alternative-contact">
    <h2>Otros Medios de Contacto</h2>
    <p>Si prefieres, también puedes contactarnos a través de:</p>
    <ul>
      <li><strong>Teléfono:</strong> +34 123 456 789</li>
      <li><strong>Email:</strong> <a href="mailto:contacto@arcadia.com">contacto@arcadia.com</a></li>
      <li><strong>Dirección:</strong> Calle Fantasía 123, Ciudad Arcadia, España</li>
    </ul>
  </section>
</main>