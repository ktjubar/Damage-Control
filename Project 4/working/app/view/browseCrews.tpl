<div class="row">
  <div class="col-sm-9">
    <h3>Browse Crews</h3>
  </div>
  <div class="col-sm-3">
    <?php if(isset($_SESSION['username'])): ?>
    <form method="get" action="<?= BASE_URL ?>/crews/add/">
      <button class="btn btn-default btn-block button">Add Crew</button>
    </form>
    <?php endif; ?>
  </div>
  <?php foreach($crews as $c): ?>
    <div class="col-sm-9">
      <h5><a href="<?= BASE_URL ?>/crews/view/<?= $c->id ?>"><?= $c->name ?></a></h5>
      <?php foreach($c->soldiers as $s): ?>
        <div class="col-sm-9">
            <a href="<?= BASE_URL ?>/soldiers/view/<?= $s->id ?>"><?= $s->first_name.", ".$s->first_name ?></a>
        </div>
      <?php endforeach; ?>
    </div>
    <?php endforeach; ?>
</div>
