<?php

/** @var Collection[] $collections_pok
 * @var Collection[] $collections_ygo
 * @var title $title
 * @var cssFile $cssFile
 * @var Collection[] $collections_lor
 * @var Collection[] $collections_mtg
 * @var Collection[] $collections_ygo
 * */ ?>

<main>
  <div class="collection-container">


    <div class="pok">
      <h2>Pokémon</h2>
      <?php foreach ($collections_pok as $collection_pok): ?>
        <div class="collection-pok">
          <div class="collection-pok-cont">
            <a href="/<?= $collection_pok->getnombreExpansion() ?>"><?= $collection_pok->getnombreExpansion() ?></a>
            <p><?= $collection_pok->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>

    </div>
    <div class="ygo">
      <h2>Yu-Gi-Oh!</h2>
      <?php foreach ($collections_ygo as $collection_ygo): ?>
        <div class="collection-ygo">
          <div class="collection-ygo-cont">
            <a href="/<?= $collection_ygo->getnombreExpansion() ?>"><?= $collection_ygo->getnombreExpansion() ?></a>
            <p><?= $collection_ygo->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <div class="mtg">
      <h2>Magic: The Gathering</h2>
      <?php foreach ($collections_mtg as $collection_mtg): ?>
        <div class="collection-mtg">
          <div class="collection-mtg-cont">
            <a href="/<?= $collection_mtg->getnombreExpansion() ?>"><?= $collection_mtg->getnombreExpansion() ?></a>
            <p><?= $collection_mtg->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <div class="lor">
      <h2>Lorcana</h2>
      <?php foreach ($collections_lor as $collection_lor): ?>
        <div class="collection-lor">
          <div class="collection-lor-cont">
            <a href="/<?= $collection_lor->getnombreExpansion() ?>"><?= $collection_lor->getnombreExpansion() ?></a>
            <p><?= $collection_lor->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <div class="op">
      <h2>One Piece</h2>
      <?php foreach ($collections_op as $collection_op): ?>
        <div class="collection-op">
          <div class="collection-op-cont">
            <a href="/<?= $collection_op->getnombreExpansion() ?>"><?= $collection_op->getnombreExpansion() ?></a>
            <p><?= $collection_op->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</main>