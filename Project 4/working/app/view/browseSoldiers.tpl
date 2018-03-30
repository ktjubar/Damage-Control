<div class="row">
  <div class="col-sm-9">
    <h3>Browse Soldiers</h3>
  </div>
  <div class="col-sm-3">
    <?php if(isset($_SESSION['username'])): ?>
    <form method="get" action="<?= BASE_URL ?>/soldiers/add/">
      <button class="btn btn-default btn-block button">Add Soldier</button>
    </form>
    <?php endif; ?>
  </div>
</div>

<?php foreach($soldiers as $s): ?>
  <div class="row">
    <div class="col-sm-9">
      <a href="<?= BASE_URL ?>/soldiers/view/<?= $s->id ?>"><?= $s->last_name.", ".$s->first_name; ?></a>
    </div>
  <div class="row">
<?php endforeach; ?>

<?php
  
?>
