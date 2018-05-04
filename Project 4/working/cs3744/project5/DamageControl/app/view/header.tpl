<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <link href="<?= BASE_URL ?>/public/img/logos/Eighth_Air_Force_Emblem.png" rel="icon">

  <title>The Mighty Eighth | <?= $pageTitle ?></title>

  <!-- styles -->
  <link href="<?= BASE_URL ?>/public/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<?= BASE_URL ?>/public/css/clean-blog.min.css" rel="stylesheet">
  <!-- <link rel="stylesheet" href="public/css/blueimp-gallery.min.css"> -->
  <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/newstyles.css">

  <!-- fonts -->
  <link href="<?= BASE_URL ?>/public/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700itali" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
</head>

<body>
  <!-- Login Modal -->
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
            <br>
            <button type="submit" class="btn btn-default btn-block">Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <span>Don't have an account? <a href="<?= BASE_URL ?>/users/register/"> Register</a></span>
        </div>
      </div>
    </div>
  </div>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="<?= BASE_URL ?>/">The Mighty Eighth</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fa fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <!-- <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/">Home</a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/articles/">Articles</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/crews/">Crews</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/soldiers/">Soldiers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/users/browse/">Users</a>
          </li>
          <?php if(!isset($_SESSION['username'])): ?>
          <!-- <li class="nav-item">
            <button type="button" class="btn btn-default btn-link" data-toggle="modal" data-target="#loginModal">Login</button>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="#loginModal" data-toggle="modal">Login</a>
          </li>
          <?php else: ?>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/users/view/<?= $_SESSION['user_id'] ?>/">My Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE_URL ?>/logout/process/">Logout</a>
          </li>
          <!-- <h4 class="text-center">Logged in as
            <?= $_SESSION['username'] ?>
          </h4> -->
          <!-- <div class="row">
            <div class="col-md-6">
              <form method="get" action="<?= BASE_URL ?>/users/view/<?= $_SESSION['user_id'] ?>/">
                <button class="btn btn-default btn-block button"><span style="font-size:smaller;">My Profile</span></button>
              </form>
            </div>
            <div class="col-md-6">
              <form action="<?= BASE_URL ?>/logout/process/">
                <button class="btn btn-default btn-block" type="submit">Logout</button>
              </form>
            </div>
          </div> -->
          <?php endif; ?>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('<?= BASE_URL ?>/public/img/<?= $imgURL ?>')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1><?= $pageHeading ?></h1>
            <span class="subheading"><?= $pageSubheading ?></span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Content Wrapper Container -->
  <div class="container">
