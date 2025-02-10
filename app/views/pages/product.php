<?php

/** 
 * @var Product|Box|Booster|Card $product
 * */
?>

<div class="product">
  <input class="hidden idJuego" value="<?php echo $product->getIdJuego(); ?>">
  <figcaption class="product-desc"><?php echo $product->getNombreProducto(); ?></figcaption>
  <sub class="product-setdesc"><?php echo $product->getcodExpansion(); ?></sub>
  <figure>
    <img src="<?php echo $product->getUrlImagen(); ?>" alt="<?php echo $product->getNombreProducto(); ?>">
    <p class="old-product-price"><?php echo $product->getPrecio(); ?>���</p>
    <p class="product-price"></p>
  </figure>
</div>