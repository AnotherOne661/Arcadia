<div class="cart-page">
  <h1 class="cart-title">Tu carrito</h1>

    <div class="cart-page-body">
      <div class="cart-body">

      </div>
      <div class="total">
        <h2>Total: <span class="cart-total">0</span>€</h2>
        <div class="session">
      <!-- Añadir el if de la sesisón -->
      <?php if (isset($_SESSION['name'])): ?>
        <form class="details" action="">
          <label for="cardNumber">Número de tarjeta de crédito:</label>
          <input type="text" id="cardNumber" name="cardNumber" placeholder="XXXX-XXXX-XXXX-XXXX" required>
          <label for="cardExpiration">Fecha de caducidad:</label>
          <input type="password" id="cardExpiration" name="cardExpiration" placeholder="11/30" required>
          <label for="cardCVC">CVC:</label>
          <input type="password" id="cardCVC" name="cardCVC" placeholder="•••" required>
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