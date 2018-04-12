<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" href="<?= BASE_URL ?>/public/img/logos/Eighth_Air_Force_Emblem.png">
  <title>The Mighty Eighth | <?= $pageTitle ?></title>
  <!-- styles -->
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/blueimp-gallery.min.css">
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/styles.css">
  <!-- scripts -->
  <script src="<?= BASE_URL ?>/public/js/jquery-3.3.1.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/bootstrap.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/bootstrap.bundle.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/js.cookie.js"></script>
  <script src="<?= BASE_URL ?>/public/js/scripts.js"></script>
</head>

<body>
  <div class="page-header container-fluid p-2 px-3">
    <div class="row">
      <div class="col-md-10">
        <img class="img-responsive logo mr-2" src="<?= BASE_URL ?>/public/img/logos/Eighth_Air_Force_Emblem.jpg" alt="8th Air Force Logo" />
        <h1>
          The Mighty Eighth
          <br>
          <small>Bomber crews of the 8th Air Force</small>
        </h1>
      </div>

      <div class="col-md-2">
        <?php if(!isset($_SESSION['username'])): ?>
        <button type="button" class="btn btn-default btn-block" data-toggle="modal" data-target="#loginModal">Login</button>

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="<?= BASE_URL ?>/login/process/" method="POST">
                  <div class="row">
                    <div class="col-sm-3">
                      <label for="username">
                        <b>Username</b>
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" placeholder="Enter Username" name="username" required>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-3">
                      <label for="password">
                        <b>Password</b>
                      </label>
                    </div>
                    <div class="col-sm-9">
                      <input type="password" placeholder="Enter Password" name="password" required>
                    </div>
                  </div>
                  <button type="submit" class="btn btn-default btn-block">Login</button>
                </form>
              </div>
              <div class="modal-footer">

              </div>
            </div>
          </div>
        </div>
        <?php else: ?>
        <h4 class="text-center">Logged in as
          <?= $_SESSION['username'] ?>
        </h4>
        <div class="row">
          <div class="col-md-6">
            <form method="get" action="<?= BASE_URL ?>/users/myProfile/">
              <button class="btn btn-default btn-block button"><span style="font-size:smaller;">My Profile</span></button>
            </form>
          </div>
          <div class="col-md-6">
            <form action="<?= BASE_URL ?>/logout/process/">
              <button class="btn btn-default btn-block" type="submit">Logout</button>
            </form>

          </div>
        </div>
        <?php endif; ?>
      </div>
    </div>
  </div>

  <nav id="mainNav" class="navbar navbar-expand-sm navbar-light bg-faded sticky-top">
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
        <li class="nav-item<?php echo strcmp($category, 'news') ? '' : ' active' ?>">
          <a class="nav-link" href="<?= BASE_URL ?>/news/">News</a>
        </li>
        <li class="nav-item<?php echo strcmp($category, 'users') ? '' : ' active' ?>">
          <a class="nav-link" href="<?= BASE_URL ?>/users/browse/">Users</a>
        </li>
      </ul>
      <form class="form-inline ml-auto">
        <button class="btn btn-light my-2 my-sm-0" type="submit">
          <i class="fa fa-search"></i>
        </button>
        <input class="form-control mr-sm-2 searchbox" type="search" placeholder="Quick search">
      </form>
      <button id="hideNav" class="btn btn-default"><i class="fa fa-times"></i></button>
    </div>
  </nav>

  <div class="container-fluid" id="pageContent">
