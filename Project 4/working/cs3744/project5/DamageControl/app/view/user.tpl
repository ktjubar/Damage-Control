<?php include_once 'helper.php'; ?>

<img class="rounded mx-auto mb-4 d-block" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" />
<h3 class="text-center"><?= $user->firstname ?> <?= $user->middlename ?> <?= $user->lastname ?></h3>
<h4 class="text-center"><?= $user->username ?></h4>
<div class="row">
  <?php if(isset($_SESSION['username']) && $user->username != $_SESSION['username'] && !($isFollowing)): ?>
  <form action="<?= BASE_URL ?>/users/follow/<?= $user->id ?>/" method="POST" class="col-md-2">
    <button class="btn btn-default btn-block" type="submit">Follow</button>
  </form>
  <?php elseif(isset($_SESSION['username']) && $user->username != $_SESSION['username'] && $isFollowing): ?>
  <form action="<?= BASE_URL ?>/users/unfollow/<?= $user->id ?>/" method="POST" class="col-md-2">
    <button class="btn btn-default btn-block" type="submit">Unfollow</button>
  </form>
  <?php endif; ?>
  <?php if((isset($_SESSION['username']) && $user->username == $_SESSION['username']) || $_SESSION['role'] == 2): ?>
  <form action="<?= BASE_URL ?>/users/edit/<?= $user->id ?>/" method="POST" class="col-md-2">
    <button class="btn btn-default btn-block" type="submit">Edit Profile</button>
  </form>
  <?php else:
        endif; ?>
</div>
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
    <h4>Following</h4>
    <br>
    <div id="friendsList" class="feed my-2 mx-1">
      <?php if(empty($following)): ?>
        <p>This user is not following anyone!</p>
      <?php else: ?>
      <?php foreach($following as $f): ?>
        <div class="row my-1 pt-3 border-top">
          <div class="col-md-12 mx-2">
            <h3><a href="<?= BASE_URL ?>/users/view/<?= $f->id ?>/"><?= $f->lastname.", ".$f->firstname ?></a></h3>
            <h4>Username: <?= $f->username ?></h4>
          </div>
        </div>
      <?php endforeach;?>
      <?php endif; ?>
    </div>
  </div>
</div>
