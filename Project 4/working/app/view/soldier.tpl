<div class="row mb-4">
  <div class="col-md-3">
    <!-- get img here -->
    <img class="img-responsive w-100" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" alt="<?= $s->last_name.", ".$s->first_name ?>" />
  </div>

  <div class="col-md-8">
    <h2><?= $s->last_name.", ".$s->first_name ?></h2>
    <h3><?= $s->numToRank() ?></h3>
    <?php if(isset($s->birthday)): ?>
      <h3>Born: <?= $s->birthday ?></h3>
    <?php endif; ?>
    <?php if(isset($s->deathday)): ?>
      <h3>Died: <?= $s->deathday ?></h3>
    <?php endif; ?>
  </div>

  <div class="col-md-1">
    <form action="<?= BASE_URL ?>/soldiers/edit/<?= $s->id ?>">
      <button class="btn btn-default btn-block button">Edit</button>
    </form>
  </div>
</div>
