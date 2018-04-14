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
    <?php if(isset($_SESSION['username'])): ?>
    <form action="<?= BASE_URL ?>/soldiers/edit/<?= $s->id ?>">
      <button class="btn btn-default btn-block button" type="submit">Edit</button>
    </form>
    <br>
    <?php if($_SESSION['role'] >= 1): ?>
    <button class="btn btn-default btn-block button" data-toggle="modal" data-target="#deleteConfirmModal">Delete</button>

    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="deleteConfirmModalLabel">Delete forever?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="<?= BASE_URL ?>/soldiers/delete/<?= $s->id ?>" method="POST">
              <button type="submit" class="btn btn-default btn-block">Delete</button>
            </form>
            <br>
            <button class="btn btn-default btn-block" data-dismiss="modal" aria-label="Close">Cancel</button>
          </div>
          <div class="modal-footer">

          </div>
        </div>
      </div>
    </div>
    <?php endif; ?>
    <?php endif; ?>
  </div>
</div>
