<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
  <link rel="icon" href="/assets/images/altern.ico">
  <link rel="stylesheet" href="<?= styleURL('styles/global.css'); ?>">
  <script defer src="<?= styleURL('js/global.js'); ?>"></script>
  <link rel="stylesheet" href="<?= styleURL("styles/$styleRoute"); ?>">
  <title><?php echo isset($page_name) ? $page_name : 'Arcadia - Tu tienda TCG' ?></title>
</head>