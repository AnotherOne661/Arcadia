<?php /** 
  * @var ProductsWithExpansion[] $new_products 
  * @var Event[] $events_images 
  * @var ProductsWithExpansion[] $sale_products 
  * @var ProductsWithExpansion[] $trending_products */ ?>
<main>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <?php foreach ($events_images as $index => $event): ?>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<?= $index; ?>"
                    class="<?= $index === 0 ? 'active' : ''; ?>" aria-label="Slide <?= $index + 1; ?>"></button>
            <?php endforeach; ?>
        </div>

        <div class="carousel-inner">
            <?php foreach ($events_images as $index => $event): ?>
                <div class="carousel-item <?= $index === 0 ? 'active' : ''; ?>">
                    <img src="<?= $event->geturlImagen(); ?>" class="slider_image" alt="Slide <?= $index + 1; ?>">
                </div>
            <?php endforeach; ?>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <section>
        <div class="novedades">
            <h2 class="secTitle">NOVEDADES</h2>
            <?php foreach ($new_products as $new_product): ?>
                <div class="newproducts product">
                    <input class="hidden idJuego" value="<?php echo $new_product->getIdJuego(); ?>">
                    <figcaption class="newproducts-desc">
                        <h3 class="productTitle"><?= $new_product->getnombreProducto(); ?></h3>
                        <h5 class="expansion"><?= $new_product->getnombreExpansion(); ?> <input class="hidden idExpansion"
                                value="<?= $new_product->getcodExpansion(); ?>"></input></h5>
                        <pre><?= $new_product->getreleaseDate(); ?></pre>
                        <div>
                            <input type="number" class="productQuantity" value="1" min="1">
                            <h6 class="productPrice"><?= $new_product->getprecio(); ?>€</h6>
                            <button class="productButton">Añadir <span><img src="/assets/images/icons/basket.png" alt=""
                                        class="basketIcon"></span></button>
                        </div>

                    </figcaption>
                    <figure class="newproducts-img">
                        <img src="<?= $new_product->geturlImagen(); ?>" alt="<?= $new_product->getnombreProducto(); ?>"
                            class="productImage">
                    </figure>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="ofertas">
            <h2 class="secTitle">OFERTAS</h2>
            <?php foreach ($sale_products as $product): ?>
                <div class="saleproducts product">
                    <input class="hidden" value="<?php echo $product->getIdJuego(); ?>">

                    <figcaption class="saleproducts-desc">
                        <h3 class="productTitle"><?= $product->getnombreProducto(); ?></h3>
                        <h5 class="expansion"><?= $product->getnombreExpansion(); ?> <input class="hidden idExpansion"
                                value="<?= $product->getcodExpansion(); ?>"></input></h5>
                        <pre><?= $product->getreleaseDate(); ?></pre>
                        <div>
                            <input type="number" class="productQuantity" value="1" min="1">
                            <h6 class="productPrice"><?= $new_product->getprecio(); ?>€</h6>
                            <button class="productButton">Añadir <span><img src="/assets/images/icons/basket.png" alt=""
                                        class="basketIcon"></span></button>
                        </div>
                    </figcaption>
                    <figure class="saleproducts-img">
                        <img src="<?= $product->geturlImagen(); ?>" class="productImage"
                            alt="<?= $product->getnombreProducto(); ?>">
                    </figure>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="trend">
            <h2 class="secTitle">TENDENCIA</h2>
            <?php foreach ($trending_products as $trending_product): ?>
                <div class="trendproducts product">
                    <input class="hidden" value="<?php echo $trending_product->getIdJuego(); ?>">

                    <figcaption class="trendproducts-desc">
                        <h3 class="productTitle"><?= $trending_product->getnombreProducto(); ?></h3>
                        <h5 class="expansion"><?= $trending_product->getnombreExpansion(); ?> <input
                                class="hidden idExpansion" value="<?= $trending_product->getcodExpansion(); ?>"></input>
                        </h5>
                        <pre><?= $trending_product->getreleaseDate(); ?></pre>
                        <div>
                            <input type="number" class="productQuantity" value="1" min="1">
                            <h6 class="productPrice"><?= $new_product->getprecio(); ?>€</h6>
                            <button class="productButton">Añadir <span><img src="/assets/images/icons/basket.png" alt=""
                                        class="basketIcon"></span></button>
                        </div>
                    </figcaption>
                    <figure class="trendproducts-img">
                        <img src="<?= $trending_product->geturlImagen(); ?>"
                            alt="<?= $trending_product->getnombreProducto(); ?>" class="productImage">
                    </figure>
                </div>
            <?php endforeach; ?>

        </div>
    </section>
</main>