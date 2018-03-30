<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>The Mighty Eighth | <?= $pageTitle ?></title>
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/blueimp-gallery.min.css">
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/styles.css">
  <script src="<?= BASE_URL ?>/public/js/jquery-3.3.1.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/bootstrap.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/bootstrap.bundle.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/scripts.js"></script>
</head>

<body>
  <div class="page-header container-fluid p-2 px-3">
    <div class="row">
      <div class="col-md-10">
        <img class="img-responsive logo mr-2" src="<?= BASE_URL ?>/public/img/logos/Eighth_Air_Force_Emblem.jpg" alt="8th Air Force Logo"
        />
        <h1>
          The Mighty Eighth
          <br>
          <small>Bomber crews of the 8th Air Force</small>
        </h1>
      </div>

      <div class="col-md-2">
        <?php if(!isset($_SESSION['username'])): ?>
        <button class="btn btn-default btn-block" onclick="document.getElementById('id01').style.display='block'">Login</button>

        <div id="id01" class="modal">
          <form class="modal-content" action="<?= BASE_URL ?>/login/process/" method="POST">
            <div>
              <label for="username">
                <b>Username</b>
              </label>
              <input type="text" placeholder="Enter Username" name="username" required>

              <label for="password">
                <b>Password</b>
              </label>
              <input type="password" placeholder="Enter Password" name="password" required>

              <button type="submit">Login</button>

              <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
          </form>
        </div>

        <script>
          // Get the modal
          var modal = document.getElementById('id01');

          // When the user clicks anywhere outside of the modal, close it
          window.onclick = function (event) {
            if (event.target == modal) {
              modal.style.display = "none";
            }
          }
        </script>
        <?php else: ?>
        <h4 class="text-center">Logged in as
          <?= $_SESSION['username'] ?>
        </h4>
        <form action="<?= BASE_URL ?>/logout/">
          <button class="btn btn-default btn-block" type="submit">Logout</button>
        </form>
        <?php endif; ?>
      </div>
    </div>
  </div>

  <nav class="navbar navbar-expand-sm navbar-light bg-faded sticky-top">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav navbar-left">
        <li class="nav-item<?php echo strcmp($category, 'home') ? '' : ' active' ?>">
          <a class="nav-link" href="<?= BASE_URL ?>">Home</a>
        </li>
        <li class="nav-item<?php echo strcmp($category, 'crews') ? '' : ' active' ?>">
          <a class="nav-link" href="<?= BASE_URL ?>/crews/">Crews</a>
        </li>
        <li class="nav-item<?php echo strcmp($category, 'soldiers') ? '' : ' active' ?>">
          <a class="nav-link" href="<?= BASE_URL ?>/soldiers/">Soldiers</a>
        </li>
        <li class="nav-item<?php echo strcmp($category, 'map') ? '' : ' active' ?>">
          <a class="nav-link" href="<?= BASE_URL ?>/maps/">Map</a>
        </li>
      </ul>
      <form class="form-inline ml-auto">
        <button class="btn btn-light my-2 my-sm-0" type="submit">
          <i class="fa fa-search"></i>
        </button>
        <input class="form-control mr-sm-2 searchbox" type="search" placeholder="Quick search">
      </form>
    </div>
  </nav>

  <div class="container-fluid" id="pageContent">
