<div class="row">
  <div class="col-sm-9">
    <h3>Browse Users</h3>
  </div>
  <div class="col-sm-3">

  </div>
</div>

<?php foreach($users as $u): ?>
  <div class="row my-1 pt-3 border-top">
    <div class="col-md-3">
      <img class="img-responsive w-100 mb-1" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" alt="<?= $u->lastname.", ".$u->firstname ?>" />
    </div>
    <div class="col-md-9">
      <h3><a href="<?= BASE_URL ?>/users/view/<?= $u->id ?>"><?= $u->lastname.", ".$u->firstname ?></a></h3>
      <h4>Username: <?= $u->username ?></h4>
      <h4>User Rank: 
    </div>
  </div><!-- person row -->
<?php endforeach; ?>
