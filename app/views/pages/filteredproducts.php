<?php
/** * @var Product[]|Box[]|Booster[]|Card[] $products
 * @var int $totalProducts */

$limit = 10;
$totalPages = ceil($totalProducts / $limit);
$page = $_GET['page'] ?? 1;
$previousPage = $page - 1;
$nextPage = $page < $totalPages ? $page + 1 : $totalPages;
?>
<main>
  <div class="products-container">
    <?php foreach ($products as $product): ?>
      <div class="product-card">
        <input type="hidden" class="idJuego" value="<?php echo $product->getIdJuego(); ?>">

        <figure class="product-image">
          <img src="<?php echo $product->getUrlImagen(); ?>"
            alt="<?php echo htmlspecialchars($product->getNombreProductoEs()); ?>">
        </figure>

        <div class="product-info">
          <a
            href="/product?code=<?php echo urlencode($product->getcodExpansion()); ?>&name=<?php echo urlencode($product->getNombreProductoEn()); ?>">
            <h2 class="product-title"><?php echo htmlspecialchars($product->getNombreProductoEn()); ?></h2>
          </a>
          <a href="/filteredproducts?name=<?php echo urlencode($product->getcodExpansion()); ?>">
            <p class="product-set"><small>Set: <?php echo htmlspecialchars($product->getcodExpansion()); ?></small></p>
          </a>


          <div class="product-pricing">
            <p class="old-product-price"><?php echo number_format($product->getPrecio(), 2); ?> ¥</p>
            <p class="product-price"></p> <!-- Dynamic price placeholder -->
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item <?php echo $page == 1 ? 'disabled' : ''; ?>">
        <a class="page-link" href="/filteredproducts?name=<?php echo $_GET['name'] ?>&page=<?php echo $previousPage ?>"
          tabindex="-1">Anterior</a>
      </li>
      <li class="page-item <?php echo $page == $totalPages ? 'disabled' : ''; ?>">
        <a class="page-link"
          href="/filteredproducts?name=<?php echo $_GET['name'] ?>&page=<?php echo $nextPage ?>">Siguiente</a>
      </li>
    </ul>
  </nav>
</main>