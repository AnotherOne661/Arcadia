<?php
$style_url = "assets/styles/index.css";

?>

<!DOCTYPE html>
<html lang="en">

<?php require_once 'includes/head.php' ?>


<body>
  <?php require_once 'includes/header.php' ?>
  <main>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
          aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
          aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
          aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="/assets/images/lastyugiset.jpg" class="slider_image" alt="Slide 1">
        </div>
        <div class="carousel-item">
          <img src="/assets/images/icons/Placeholder.svg" class="slider_image" alt="Slide 2">
        </div>
        <div class="carousel-item">
          <img src="/assets/images/icons/Placeholder.svg" class="slider_image" alt="Slide 3">
        </div>
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

    <div>
      <div id="novedades">
        <div>
          <div id="eve">
            <h2>25 Aniversario Yu-Gi-Oh!</h2>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptas temporibus laboriosam autem iusto
              doloribus dolores assumenda cum sed deleniti delectus? Illum, consectetur enim? Labore unde reiciendis sed
              laudantium nam repudiandae.</p>
            <a>¡No te lo pierdas!</a>
          </div>
          <div id="eveimg">
            <img>
          </div>
        </div>
        <div>
          <div>
            <h3>Placeholder title</h3>
          </div>
          <section>
            <h3>Placeholder new obj</h3>
          </section>
        </div>
      </div>
      <div id="ofertas">
        <h4>placeholder ofertas</h4>
      </div>
      <div id="trending">
        <h4>placeholder trending</h4>
      </div>
    </div>
  </main>
  <?php
  require_once 'includes/footer.php'
    ?>
</body>

</html>