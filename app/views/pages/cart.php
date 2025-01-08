<div>
  <h1>Tu carrito</h1>
  <div>
    <div>
      <div class="cart-body">

      </div>
      <div>
        <h2>Total: <span class="cart-total">0</span>€</h2>
        <button class="buyButton">Comprar</button>
      </div>
    </div>
    <div>
      <!-- Añadir el if de la sesisón -->
      <form action="">
        <label for="cardNumber">Número de tarjeta de crédito:</label>
        <input type="text" id="cardNumber" name="cardNumber" required>
        <label for="cardExpiration">Fecha de caducidad:</label>
        <input type="text" id="cardExpiration" name="cardExpiration" required>
        <label for="cardCVC">CVC:</label>
        <input type="text" id="cardCVC" name="cardCVC" required>
        <button type="submit">Pagar</button>
      </form>
    </div>
  </div>
</div>