<?php

/** @var Collection[] $collections_poke
 * @var Collection[] $collections_ygo
 * @var title $title
 * @var cssFile $cssFile
 * @var Collection[] $collections_lor
 * @var Collection[] $collections_mtg
 * @var Collection[] $collections_ygo
 * */ ?>

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

  <div class="mtg">
    <h2>Magic: The Gathering</h2>
    <?php foreach ($collections_mtg as $collection_mtg): ?>
      <div class="collection-mtg">
        <div class="collection-mtg-cont">
          <h3><?= $collection_mtg->getnombreExpansion() ?></h3>
          <p><?= $collection_mtg->getFechaLanzamiento() ?></p>
        </div>
        <div class="collection-mtg-img">
          <img src='<?= $collection_mtg->geturlImagen() ?>' alt>
        </div>
      </div>
    <?php endforeach; ?>
  </div>

  <div class="lor">
    <h2>Lorcana</h2>
    <?php foreach ($collections_lor as $collection_lor): ?>
      <div class="collection-lor">
        <div class="collection-lor-cont">
          <h3><?= $collection_lor->getnombreExpansion() ?></h3>
          <p><?= $collection_lor->getFechaLanzamiento() ?></p>
        </div>
        <div class="collection-lor-img">
          <img src='<?= $collection_lor->geturlImagen() ?>' alt>
        </div>
      </div>
    <?php endforeach; ?>
  </div>

  <div class="op">
    <h2>One Piece</h2>
    <?php foreach ($collections_op as $collection_op): ?>
      <div class="collection-op">
        <div class="collection-op-cont">
          <h3><?= $collection_op->getnombreExpansion() ?></h3>
          <p><?= $collection_op->getFechaLanzamiento() ?></p>
        </div>
        <div class="collection-op-img">
          <img src='<?= $collection_op->geturlImagen() ?>' alt>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
</div>