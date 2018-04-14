<?php include 'helper.php'; ?>

<img class="rounded mx-auto mb-4 d-block" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" />
<h3 class="text-center"><?= $user->firstname ?> <?= $user->middlename ?> <?= $user->lastname ?></h3>
<h4 class="text-center"><?= $user->username ?></h4>
<?php if(isset($_SESSION['username']) && $user->username != $_SESSION['username'] && !($friend)): ?>
<form action="<?= BASE_URL ?>/users/friend/" method="POST">
  <button class="btn btn-default">Add Friend</button>
</form>
<?php elseif(isset($_SESSION['username']) && $user->username != $_SESSION['username'] && $friend): ?>
<form action="<?= BASE_URL ?>/users/unfriend/" method="POST">
  <button class="btn btn-default">Remove Friend</button>
</form>
<?php endif; ?>
<div class="row border-top mt-4">
  <div class="col-md-8 mt-4">
    <!-- main column -->
    This is this user's main page! There will be some other stuff here later.
  </div>
  <div class="col-md-4 mt-4">
    <!-- activity feed -->
    <h4>User Feed</h4>
    <br>
    <div id="userFeed" class="feed my-2 mx-1">
      <?php if(empty($fes)): ?>
        <p>No events yet.</p>
      <?php else: ?>
      <?php foreach($fes as $fe): ?>
        <div class="row p-2 border">
          <div class="col-12">
            <?= formatEvent($fe) ?>
          </div>
        </div>
      <?php endforeach; ?>
      <?php endif; ?>
    </div>
    <br>
    <!-- friend list -->
    <h4>Friends</h4>
    <br>
    <div id="friendsList" class="feed my-2 mx-1">
      <?php if(empty($friends)): ?>
        <p>This user has no friends!</p>
      <?php else: ?>
      <?php foreach($friends as $f): ?>
        <div class="row my-1 pt-3 border-top">
          <div class="col-md-12">
            <h3><a href="<?= BASE_URL ?>/users/view/<?= $f->id ?>/"><?= $f->lastname.", ".$f->firstname ?></a></h3>
            <h4>Username: <?= $f->username ?></h4>
          </div>
        </div>
      <?php endforeach;?>
      <?php endif; ?>
    </div>
  </div>
</div>
