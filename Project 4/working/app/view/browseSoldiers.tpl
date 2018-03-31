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
  <div class="row my-1 pt-3 border-top">
    <div class="col-md-3">
      <img class="img-responsive w-100 mb-1" src="" alt="" />
    </div>
    <div class="col-md-9">
      <h3><a href="<?= BASE_URL ?>/soldiers/view/<?= $s->id ?>"><?= $s->last_name.", ".$s->first_name ?></a></h3>
      <?php if(isset($s->birthday)): ?>
        <h4>Born: <?= $s->birthday ?></h4>
      <?php endif; ?>
      <?php if(isset($s->deathday)): ?>
        <h4>Died: <?= $s->deathday ?></h4>
      <?php endif; ?>
    </div>
  </div><!-- person row -->
<?php endforeach; ?>
