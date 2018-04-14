<div class="row">
  <div class="col-sm-9">
    <h3>Browse Users</h3>
  </div>
  <div class="col-sm-3">

  </div>
</div>

<?php foreach($users as $u): ?>
  <div class="row my-1 pt-3 border-top">
    <div class="col-md-12">
      <h3><a href="<?= BASE_URL ?>/users/view/<?= $u->id ?>"><?= $u->lastname.", ".$u->firstname ?></a></h3>
      <h4>Username: <?= $u->username ?></h4>
    </div>
  </div><!-- person row -->
<?php endforeach; ?>
