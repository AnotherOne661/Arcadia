<div class="cart-page">
  <h1 class="cart-title">Tu carrito</h1>

  <div class="cart-page-body">

    <div class="cart-body">
      <!-- Cart items will be dynamically populated here -->

    </div>
    <div class="total">
      <button class="buyNow"><a href="/home">Comprar ahora</a></button>

      <h2>Total: <span class="cart-total">0</span>€</h2>
      <button class="clear-cart">Vaciar carrito</button>
      <div class="session">
        <?php if (isset($_SESSION['name'])): ?>
          <form class="details">
            <h2>Detalles de pago</h2>

            <label for="name">Nombre completo:</label>
            <input type="text" id="name" name="name" placeholder="Yugi Muto" required>

            <label for="community">Comunidad autónoma:</label>
            <input type="text" id="community" name="community" placeholder="Comunidad de Madrid" required>

            <label for="localidad">Ciudad:</label>
            <input type="text" id="localidad" name="localidad" placeholder="Madrid" required>

            <label for="address">Dirección de envío:</label>
            <input type="text" id="address" name="address" placeholder="Calle Desengaño, 21, Ático A" required>

            <label for="postalCode">Código postal:</label>
            <input type="text" id="postalCode" name="postalCode" placeholder="08001" required>

            <label for="card-element">Detalles de la tarjeta:</label>
            <div id="card-element"><!-- Stripe Element inserted here --></div>

            <!-- Display error messages -->
            <div id="card-errors" role="alert"></div>

            <button type="submit">Pagar</button>
          </form>
        <?php else: ?>
          <a href="/login">Inicia sesión</a>
        <?php endif; ?>
      </div>
    </div>

    <figure class="cart-image">

      <img src="/assets/images/struc/cart/urza.webp" alt="Urza, High Artificer">
    </figure>

  </div>
</div>
<script src="https://js.stripe.com/v3/"></script>