<?php /** * @var Product|Box|Booster|Card $product * */ ?>
<main>
  <div class="product">
    <input type="hidden" class="idJuego hidden idExpansion" value="<?= $product->getIdJuego(); ?>">


    <div class="product-info">
      <h2 class="product-subtitle"><?php echo htmlspecialchars($product->getNombreProductoEs()); ?></h2>
      <h2 class="productTitle productSubTitle"><?php echo htmlspecialchars($product->getNombreProductoEn()); ?></h2>
      <a href="#" class="product-set"><?php echo htmlspecialchars($product->getcodExpansion()); ?></a>
      <?php
      if ($product instanceof Card) {
        echo '<p class="product-type">Carta</p>';
        echo '<p class="product-attributes">' . $product->getAtributos() . '</p>';
      } elseif ($product instanceof Box) {
        echo '<p class="product-type">Caja</p>';
        echo '<p class="product-attributes">' . $product->getNumCartas() . '</p>';
      } elseif ($product instanceof Booster) {
        echo '<p class="product-type">Sobre</p>';
        echo '<p class="product-attributes">' . $product->getNumCartas() . '</p>';
      }
      ?>
      <div class="product-pricing">
        <h4 class="productPrice"><?php echo $product->getPrecio(); ?> €</h4>
        <input type="number" name="" id="" class="productQuantity" value="1" min="1">
        <h4 class="discount-product-price"></h4> <!-- Dynamic price placeholder -->
      </div>
      <button class="productButton cart-button">Añadir al carrito</button>
    </div>
    <figure class="product-image">
      <img src="<?php echo $product->getUrlImagen(); ?>"
        alt="<?php echo htmlspecialchars($product->getNombreProductoEs()); ?>">
    </figure>
  </div>

</main>