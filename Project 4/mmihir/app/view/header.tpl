<!DOCTYPE html>
<html lang="en">

<head>
  <title>
    <?= $pageTitle ?> | The Doe Family</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/main.css" />
  <script type="text/javascript">
    var base_url = '<?= BASE_URL ?>';
  </script>
</head>

<body>
  <header id="header">
    <h1>
      <a href="<?= BASE_URL ?>">The Doe Family</a>
    </h1>
    <nav>
      <a href="<?= BASE_URL ?>">Home</a>
      <a href="<?= BASE_URL ?>/family/">Family</a>
      <?php if(isset($_SESSION['username'])): ?>
      <a href="<?= BASE_URL ?>/family/add/">Add Member</a>
      <a href="<?= BASE_URL ?>/about/">About</a>
      <a href="<?= BASE_URL ?>/dashboard/">Logged in as
        <strong>
          <?= $_SESSION['username'] ?>
        </strong>
      </a>
      <a href="<?= BASE_URL ?>/logout/">Logout</a>
      <?php else: ?>
      <a href="<?= BASE_URL ?>/about/">About</a>
      <a href="<?= BASE_URL ?>/login/">Login</a>
      <?php endif; ?>
    </nav>
  </header>
</body>