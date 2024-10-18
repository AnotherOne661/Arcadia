<?php
$page_name = "Landing";
$style_url = "../assets/styles/landing.php"
  ?>


<?php
require_once __DIR__ . '/../includes/head.php';
?>

<body>
  <header>
    <div id="logocont">
      <img>
    </div>
    <div id="socialmedia">

    </div>
  </header>
  <main>
    <section>
      <h1>Arcadia - Tu tienda TCG</h1>
      <div id="logo">
        <a href="../index.php"><img src="<?php echo $ABS_URL; ?>images/altern.png" alt=""></a>
      </div>
    </section>
    <div>
      <div id="products">
        <div class="product">
          <figcaption class="product-desc">
            <h3>Placeholder title</h3>
          </figcaption>
          <figure class="product-img">
            <h3>Placeholder new obj</h3>
          </figure>
          <a class="buyprod" href="#">Comprar</a>
        </div>
        <div class="product">
          <figcaption class="product-desc">
            <h3>Placeholder title</h3>
          </figcaption>
          <figure class="product-img">
            <h3>Placeholder new obj</h3>
          </figure>
          <a class="buyprod" href="#">Comprar</a>
        </div>
        <div class="product">
          <figcaption class="product-desc">
            <h3>Placeholder title</h3>
          </figcaption>
          <figure class="product-img">
            <h3>Placeholder new obj</h3>
          </figure>
          <a class="buyprod" href="#">Comprar</a>
        </div>
      </div>
      <div id="formulario">
        <form>
          <label for="email">¡Recibe nuestras novedades!</label>
          <input type="email" id="email" name="email" required>
          <button type="submit">Suscribirme</button>
        </form>
      </div>
    </div>
  </main>
  <footer>

  </footer>
</body>