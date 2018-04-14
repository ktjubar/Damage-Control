<img class="rounded mx-auto mb-4 d-block" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" />
<h3 class="text-center"><?= $user->firstname ?> <?= $user->middlename ?> <?= $user->lastname ?></h3>
<h4 class="text-center"><?= $user->username ?></h4>
<?php if($user->username != $_SESSION['username']): ?>
<form>
  <button class="btn btn-default">Add Friend</button>
</form>
<?php endif; ?>
<div class="row border-top mt-4">
  <div class="col-md-8">
    <!-- main column -->
  </div>
  <div class="col-md-4">
    <!-- activity feed -->
  </div>
</div>
