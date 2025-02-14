<?php /** * @var Product|Box|Booster|Card $product * */
switch (get_class($product)) {
  case 'Box':
    $numSobres = $product->getNumCartas();
    break;
  case 'Booster':
    $numSobres = $product->getNumCartas();
    break;
  case 'Card':
    $atributos = explode(",", $product->getAtributos());
    var_dump($atributos);

    break;
  default:
    $productType = 'Producto';
    break;
}
?>
<main>
  <div class="product">
    <input type="hidden" class="idJuego hidden idExpansion" value="<?= $product->getIdJuego(); ?>">


    <div class="product-info">
      <h2 class="product-subtitle"><?php echo htmlspecialchars($product->getNombreProductoEs()); ?></h2>
      <h2 class="productTitle productSubTitle"><?php echo htmlspecialchars($product->getNombreProductoEn()); ?></h2>
      <a href="#" class="product-set"><?php echo htmlspecialchars($product->getcodExpansion()); ?></a>
      <?php
      if ($product instanceof Card) {
        echo '<div class="attributes">';
        foreach ($atributos as $atributo) {
          echo '<p class="product-attributes">' . $atributo . '</p>';
        }
        echo '</div>';
      } elseif ($product instanceof Box) {
        echo '<p class="product-attributes"> La caja contiene ' . $product->getNumCartas() . ' sobres</p>';
      } elseif ($product instanceof Booster) {
        echo '<p class="product-attributes"> El sobre contiene ' . $product->getNumCartas() . ' cartas</p>';
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