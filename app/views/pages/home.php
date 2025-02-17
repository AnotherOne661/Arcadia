<?php

/** 
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
                    <img loading="lazy" src="<?= $event->geturlImagen(); ?>" class="slider_image"
                        alt="Slide <?= $index + 1; ?>">
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
        <div class="novedades productcont">
            <h2 class="secTitle">NOVEDADES</h2>
            <?php foreach ($new_products as $new_product): ?>
                <div class="newproducts product">
                    <input class="hidden idJuego" value="<?php echo $new_product->getIdJuego(); ?>">
                    <figcaption class="newproducts-desc">

                        <a
                            href="/product?code=<?= urlencode($new_product->getcodExpansion()) ?>&name=<?= urlencode($new_product->getnombreProductoEn()); ?>">
                            <h3 class="productTitle">
                                <?php
                                echo $new_product->getnombreProductoEn();
                                ?>
                            </h3>

                            <h3 class="productSubTitle">
                                <?php
                                echo $new_product->getnombreProductoEs();
                                ?>
                            </h3>
                        </a>



                        <a class="expansion-dark" href="/filteredproducts?name=<?= $new_product->getcodExpansion(); ?>"><?= $new_product->getnombreExpansion(); ?></a> 

                        <pre><?= $new_product->getreleaseDate(); ?></pre>
                        <div>
                            <label for="quantity">Cantidad:</label>
                            <input type="number" id="quantity" name="quantity" class="productQuantity" value="1" min="1"
                                aria-label="Ingresa la cantidad deseada">
                            <h5 class="productPrice"><?= $new_product->getprecio(); ?>€</h5>
                            <button class="productButton">Añadir <span><img src="/assets/images/icons/basket.png" alt=""
                                        class="basketIcon"></span></button>
                        </div>

                    </figcaption>
                    <figure class="newproducts-img img-container">
                        <img src="<?= $new_product->geturlImagen(); ?>" alt="<?= $new_product->getnombreProductoEs(); ?>"
                            class="productImage">
                    </figure>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="ofertas productcont">
            <h2 class="secTitle">OFERTAS</h2>
            <?php foreach ($sale_products as $product): ?>
                <div class="saleproducts product">
                    <input class="hidden idJuego" value="<?php echo $product->getIdJuego(); ?>">

                    <figcaption class="saleproducts-desc">
                        <a
                            href="/product?code=<?= urlencode($product->getcodExpansion()) ?>&name=<?= urlencode($product->getnombreProductoEn()); ?>">

                            <h3 class="productTitle">
                                <?=
                                    $product->getnombreProductoEn();
                                ?>
                            </h3>

                            <h3 class="productSubTitle"><?= $product->getnombreProductoEs();
                            ?></h3>
                        </a>

                        <a class="expansion" href="/filteredproducts?name=<?= $product->getcodExpansion(); ?>"><?= $product->getnombreExpansion(); ?></a>

                        <pre><?= $product->getreleaseDate(); ?></pre>
                        <div>
                            <label for="quantity">Cantidad:</label>
                            <input type="number" id="quantity" name="quantity" class="productQuantity" value="1" min="1"
                                title="Ingresa la cantidad deseada">
                            <h5 class="productPrice"><?= $product->getprecio(); ?>€</h5>
                            <button class="productButton">Añadir <span><img src="/assets/images/icons/basket.png" alt=""
                                        class="basketIcon"></span></button>
                        </div>
                    </figcaption>
                    <figure class="saleproducts-img img-container">
                        <img src="<?= $product->geturlImagen(); ?>" class="productImage"
                            alt="<?= $product->getnombreProductoEs(); ?>">
                    </figure>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="trend productcont">
            <h2 class="secTitle">TENDENCIA</h2>
            <?php foreach ($trending_products as $trending_product): ?>
                <div class="trendproducts product">

                    <input class="hidden idJuego" value="<?php echo $trending_product->getIdJuego(); ?>">

                    <figcaption class="trendproducts-desc">
                        <a
                            href="/product?code=<?= urlencode($trending_product->getcodExpansion()) ?>&name=<?= urlencode($trending_product->getnombreProductoEn()); ?>">

                            <h3 class="productTitle"> <?php
                            echo $trending_product->getnombreProductoEn();
                            ?> </h3>
                            <h3 class="productSubTitle"><?php
                            echo $trending_product->getnombreProductoEs();
                            ?></h3>
                        </a>
                        <?php 
                        $esName = explode("|",$trending_product->getnombreExpansion());
                        $enExpan = $esName[1];
                        ?>
                        <a class="expansion-dark" href="/filteredproducts?name=<?= $enExpan; ?>"><?= $enExpan; ?></a>
                        <pre><?= $trending_product->getreleaseDate(); ?></pre>
                        <div>
                            <label for="quantity">Cantidad:</label>
                            <input type="number" id="quantity" name="quantity" class="productQuantity" value="1" min="1"
                                title="Ingresa la cantidad deseada">
                            <h5 class="productPrice"><?= $trending_product->getprecio(); ?>€</h5>
                            <button class="productButton">Añadir <span><img src="/assets/images/icons/basket.png" alt=""
                                        class="basketIcon"></span></button>
                        </div>
                    </figcaption>
                    <figure class="trendproducts-img img-container">
                        <img src="<?= $trending_product->geturlImagen(); ?>"
                            alt="<?= $trending_product->getnombreProductoEs(); ?>" class="productImage">
                    </figure>
                </div>
            <?php endforeach; ?>
                
        </div>

    </section>
</main>