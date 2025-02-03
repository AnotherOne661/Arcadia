<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../assets/styles/login.css">
  <link rel="stylesheet" href="\styles\lib\bootstrap.min.css">
  <script defer src="\js\lib\bootstrap.bundle.min.js"></script>
  <script defer src="\js\lib\sweetalert2.all.min.js"></script>
  <link rel="stylesheet" href="\styles\lib\sweetalert2.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="icon" href="../assets/images/altern.ico">
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
    integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
  <script defer src="/js/global.js"></script>
  <script defer src="/js/<?php echo isset($jsFile) ? $jsFile : '' ?>"></script>
  <link rel="stylesheet" href="/styles/global.css">
  <link rel="stylesheet" href="<?php echo isset($cssFile) ? "styles/$cssFile" : '' ?>">
  <meta name="description"
    content="Arcadia, tienda TCG, compra online/presencial; Magic The Gathering, Yu-Gi-Oh!, Lorcana, One Piece, Pokémon a precios bajos. Eventos y torneos disponibles.">
  <meta name="keywords"
    content="Arcadia,Comprar,TCG,METAGAME,Yu-gi-oh!, Magic The Gathering, MTG, Lorcana, Pokémon, Online, Cartas, Juego de cartas, jugar, eventos">
  <title><?php echo isset($title) ? $title : 'Arcadia - Tu tienda TCG' ?></title>
</head>