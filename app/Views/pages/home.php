<?php 
/**
 * @var ProductsWithExpansion[] $new_products
 */
?> 
<div
    id="carouselExampleIndicators"
    class="carousel slide"
    data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"></button>
        <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="1"
            aria-label="Slide 2"></button>
        <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="2"
            aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img
                src="/assets/images/lastyugiset.jpg"
                class="slider_image"
                alt="Slide 1" />
        </div>
        <div class="carousel-item">
            <img
                src="/assets/images/icons/Placeholder.svg"
                class="slider_image"
                alt="Slide 2" />
        </div>
        <div class="carousel-item">
            <img
                src="/assets/images/icons/Placeholder.svg"
                class="slider_image"
                alt="Slide 3" />
        </div>
    </div>
    <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<section>
    <div id="novedades">
    <?php foreach ($new_products as $new_product): ?>
        <div class="newproducts">
            <figcaption class="newproducts-desc">
                <h3><?= $new_product->getnombreProducto(); ?></h3>
                <h5><?= $new_product->getnombreExpansion(); ?></p>
                <pre><?= $new_product->getreleaseDate(); ?></pre>
            </figcaption>
            <figure class="newproducts-img">
                <img src="<?= $new_product->geturlImagen(); ?>" alt="">
            </figure>
        </div>
        <?php endforeach;?>
    </div>
    <div id="ofertas">
        <div class="sale">
            <figcaption class="sale-desc">
                <h3>Placeholder title</h3>
            </figcaption>
            <figure class="sale-img">
                <h3>Placeholder new obj</h3>
            </figure>
        </div>
    </div>
    <div id="trend">
        <div class="trending">
            <figcaption class="trending-desc">
                <h3>Placeholder title</h3>
            </figcaption>
            <figure class="trending-img">
                <h3>Placeholder new obj</h3>
            </figure>
        </div>
    </div>
</section>