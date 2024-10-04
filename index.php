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
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/../assets/images/icons/Placeholder.svg" class="slider_image" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/../assets/images/icons/Placeholder.svg" class="slider_image" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/../assets/images/icons/Placeholder.svg" class="slider_image" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>   
    <div id="novedades">
      <h4>placeholder novedades</h4>
    </div>
    <div id="ofertas">
      <h4>placeholder ofertas</h4>
    </div>
    <div id="trending">
      <h4>placeholder trending</h4>
    </div>
  </main>
  <footer></footer>
</body>

</html>