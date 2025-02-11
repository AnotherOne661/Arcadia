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
            <?php $esName = explode("|", $collection_pok->getnombreExpansion()) ?>
            <a href="/filteredproducts?name=<?= $collection_pok->getnombreExpansion() ?>"><?php
              if (count($esName) < 2) {
                print_r($esName[1]);
              } else {
                echo $esName[1];
              }
              ?></a>
            <p><?= $collection_pok->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>

    </div>
    <div class="ygo">
      <h2>Yu-Gi-Oh!</h2>
      <?php foreach ($collections_ygo as $collection_ygo): ?>
        <div class="collection-ygo">
          <?php $esName = explode("|", $collection_ygo->getnombreExpansion()) ?>

          <div class="collection-ygo-cont">
            <a href="/filteredproducts?name=<?= $collection_ygo->getnombreExpansion() ?>"><?php
              if (count($esName) < 2) {
                print_r($esName[1]);
              } else {
                echo $esName[1];
              }
              ?></a>
            <p><?= $collection_ygo->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <div class="mtg">
      <h2>Magic: The Gathering</h2>
      <?php foreach ($collections_mtg as $collection_mtg): ?>
        <div class="collection-mtg">
          <?php $esName = explode("|", $collection_mtg->getnombreExpansion()) ?>
          <div class="collection-mtg-cont">
            <a href="/filteredproducts?name=<?= $collection_mtg->getnombreExpansion() ?>"><?php
              if (count($esName) < 2) {
                print_r($esName[1]);
              } else {
                echo $esName[1];
              }
              ?></a>
            <p><?= $collection_mtg->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <div class="lor">
      <h2>Lorcana</h2>
      <?php foreach ($collections_lor as $collection_lor): ?>
        <?php $esName = explode("|", $collection_lor->getnombreExpansion()) ?>
        <div class="collection-lor">
          <div class="collection-lor-cont">
            <a href="/filteredproducts?name=<?= $collection_lor->getnombreExpansion() ?>"><?php
              if (count($esName) < 2) {
                print_r($esName[1]);
              } else {
                echo $esName[1];
              }
              ?></a>
            <p><?= $collection_lor->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>

    <div class="op">
      <h2>One Piece</h2>
      <?php foreach ($collections_op as $collection_op): ?>
        <?php $esName = explode("|", $collection_op->getnombreExpansion()) ?>

        <div class="collection-op">
          <div class="collection-op-cont">
            <a href="/filteredproducts?name=<?= $collection_op->getnombreExpansion() ?>"><?php
              if (count($esName) < 2) {
                print_r($esName[1]);
              } else {
                echo $esName[1];
              }
              ?></a>
            <p><?= $collection_op->getFechaLanzamiento() ?></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</main>