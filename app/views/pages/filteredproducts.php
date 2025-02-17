<?php
/**
 * @var Product[]|Box[]|Booster[]|Card[] $products
 * @var int $totalProducts
 * @var string[] $games 
 * @var string[] $expansions
 */

$limit = 10;
$totalPages = ceil($totalProducts / $limit) ?: 1;
$page = $_GET['page'] ?? 1;

$previousPage = $page > 1 ? $page - 1 : 1;
$nextPage = $page < $totalPages ? $page + 1 : $totalPages;

$name = isset($_GET['name']) ? $_GET['name'] : '';
$game = isset($_GET['game']) ? $_GET['game'] : 'all';
?>
<main>
  <div class="page-container">
    <section class="filter">
      <form class="formfilter" method="GET">
        <input type="search" name="name" id="name" placeholder="Buscar"
          value="<?= isset($_GET['name']) ? $_GET['name'] : ''; ?>">
        <select name="game" id="game">
          <option value="all">Todos los juegos</option>
          <?php foreach ($games as $gg): ?>
            <option value="<?php echo $gg; ?>" <?php echo isset($_GET['game']) && $_GET['game'] === $gg ? 'selected' : ''; ?>>
              <?php echo $gg; ?>
            </option>
          <?php endforeach; ?>
        </select>
        <select name="expansion" id="expansion" <?php echo $game === 'all' ? "disabled='disabled'" : ''; ?>>
          <option value="all">Todas las expansiones</option>
          <?php foreach ($expansions as $expansion): ?>
            <option value="<?php echo $expansion; ?>" <?php echo isset($_GET['expansion']) && $_GET['expansion'] === $expansion ? 'selected' : ''; ?>>
              <?php 
              $esName = explode("|",$expansion);
              echo $esName[1];
               ?>
            </option>
          <?php endforeach; ?>
        </select>
        <input type="hidden" name="page" id="page" value="<?php echo $page; ?>">
        <button class="filterproducts" type="submit">Buscar</button>
      </form>
      <div class="results">
        <h1>Resultados de búsqueda</h1>
        <p>Se encontraron <?php echo $totalProducts; ?> resultados</p>
      </div>
    </section>

    <div class="products-container">
      <?php foreach ($products as $product): ?>
        <div class="product-card">
          <input type="hidden" class="idJuego" value="<?php echo $product->getIdJuego(); ?>">

          <figure class="product-image">
            <img src="<?php echo $product->getUrlImagen(); ?>"
              alt="<?php echo htmlspecialchars($product->getNombreProductoEs()); ?>">
          </figure>

          <div class="product-info">
            <a class="product-title"
              href="/product?code=<?php echo urlencode($product->getcodExpansion()); ?>&name=<?php echo urlencode($product->getNombreProductoEn()); ?>">
              <h2 class="product-title"><?php echo htmlspecialchars($product->getNombreProductoEn()); ?></h2>
            </a>
            <a class="product-set" href="/filteredproducts?name=<?php echo urlencode($product->getcodExpansion()); ?>">
              <p class="product-set"><small>Set: <?php echo htmlspecialchars($product->getcodExpansion()); ?></small></p>
            </a>


            <div class="product-pricing">
              <p class="product-price"><?php echo number_format($product->getPrecio(), 2); ?> €</p>
            </div>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

  </div>
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item <?php echo $page == 1 ? 'disabled' : ''; ?>">
        <a class="page-link"
          href="/filteredproducts?name=<?php echo $name ?>&page=<?php echo $previousPage ?>&game=<?php echo $game ?>"
          tabindex="-1">Anterior</a>
      </li>
      <li class="page-item <?php echo $page == $totalPages ? 'disabled' : ''; ?>">
        <a class="page-link"
          href="/filteredproducts?name=<?php echo $name ?>&page=<?php echo $nextPage ?>&game=<?= $game ?>">Siguiente</a>
      </li>
    </ul>
  </nav>
</main>