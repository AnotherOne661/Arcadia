<?php /** @var Collection[] $collections 
 * @var title $title
 * @var cssFile $cssFile*/ ?>

<div class="collection-container">

<?php foreach ($collections as $collection): ?>
  <div class="pokemon">
            <h2>Pokémon</h2>
            <div class="collection-poke">
                    <div class="collection-poke-img">
                        <img src="" alt="">
                    </div>
                    <h3><?= $collection->getnombreExpansion() ?></h3>
                    <p><?= $collection->getFechaLanzamiento() ?></p>
              </div>  
    </div>        
<?php endforeach; ?>
</div>