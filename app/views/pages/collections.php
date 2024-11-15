<?php

/** @var Collection[] $collections_poke
 * @var Collection[] $collections_ygo
 * @var title $title
 * @var cssFile $cssFile*/ ?>

<div class="collection-container">


  <div class="pokemon">
    <h2>Pokémon</h2>
    <?php foreach ($collections_poke as $collection_poke): ?>
      <div class="collection-poke">
        <div class="collection-poke-cont">
          <h3><?= $collection_poke->getnombreExpansion() ?></h3>
          <p><?= $collection_poke->getFechaLanzamiento() ?></p>
        </div>
        <div class="collection-poke-img">
          <img src='<?= $collection_poke->geturlImagen() ?>' alt>
        </div>
      </div>
    <?php endforeach; ?>

  </div>
  <div class="ygo">
    <h2>Yu-Gi-Oh!</h2>
    <?php foreach ($collections_ygo as $collection_ygo): ?>
      <div class="collection-ygo">
        <div class="collection-ygo-cont">
          <h3><?= $collection_ygo->getnombreExpansion() ?></h3>
          <p><?= $collection_ygo->getFechaLanzamiento() ?></p>
        </div>
        <div class="collection-ygo-img">
          <img src='<?= $collection_ygo->geturlImagen() ?>' alt>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
</div>