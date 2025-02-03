<main>
  <div class="about">
    <div>
      <h2><strong>Sobre Nosotros</strong></h2>
      <p>¡Bienvenido a Arcadia! Somos más que una tienda de juegos de cartas coleccionables (TCG); somos un punto de
        encuentro para jugadores, coleccionistas y entusiastas de la estrategia. Desde nuestros inicios, nos hemos
        dedicado a ofrecer una amplia selección de cartas y productos de los juegos más populares, incluyendo Magic: The
        Gathering, Yu-Gi-Oh!, Pokémon TCG, y muchos más.
      <p>
        En Arcadia, no solo encontrarás las cartas que necesitas, sino también un espacio donde compartir tu pasión por
        los TCG. Nos enorgullece ser parte de una comunidad vibrante y en constante crecimiento, apoyando tanto a
        jugadores casuales como a competidores serios.

      </p>
      <p>
        Nuestra misión es simple: ofrecer productos de calidad, información actualizada y un servicio excepcional para
        que
        disfrutes al máximo de tu afición. Ya seas un veterano en busca de esa carta rara o alguien que recién empieza
        su
        aventura en el mundo de los TCG, en Arcadia encontrarás todo lo que necesitas.
      </p>
    </div>

    <div class="logoCont">
      <img src="/assets/images/altern.png" alt="">
    </div>

  </div>
  <div class="contact">
    <div class="contact-info">
      <h1><strong class="red">Contáctanos</strong></h1>
      <p>¿Tienes preguntas, sugerencias o necesitas ayuda con tu pedido? ¡Estamos aquí para ayudarte!</p>

      <form action="procesar_formulario.php" method="POST" class="contact-form">
        <div class="form-field">
          <label for="nombre">Nombre:</label>
          <input type="text" id="nombre" name="nombre" placeholder="Ajani, fuerza primigenia" required>

        </div>

        <div class="form-field">
          <label for="email">Correo Electrónico:</label>
          <input type="email" id="email" name="email" placeholder="furro@buenagente.com" required>

        </div>

        <div class="form-field">
          <label for="asunto">Asunto:</label>
          <input type="text" id="asunto" name="asunto" placeholder="Motivo de tu consulta" required>

        </div>

        <div class="form-textarea">
          <label for="mensaje">Mensaje:</label>
          <textarea id="mensaje" name="mensaje" rows="5" placeholder="Cuéntanos en detalle cómo podemos ayudarte"
            required></textarea>
          <button type="submit">Enviar Mensaje</button>
        </div>

      </form>

      <div>
        <p><strong class="red">Email:</strong> soporte@arcadiatcg.com</p>
        <p><strong class="red">Teléfono:</strong> +34 123 456 789</p>
        <p><strong class="red">Horario de atención:</strong> Lunes a Viernes, de 9:00 a 18:00 (CET)</p>
      </div>

    </div>

    <div id="map"></div>

  </div>

</main>