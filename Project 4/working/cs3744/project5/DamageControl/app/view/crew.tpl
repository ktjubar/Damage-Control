<div class="row">
  <div class="col-12">
    <h3><?= $crew->name ?>
    <?php if(isset($crew->nick)): ?>
      <small>- <?= $crew->nick ?></small>
    <?php endif; ?></h3>
    <p class="text-justify fr-view"><?= $crew->description ?></p>
  </div>
</div>
<div class="row mb-4">
  <?php if($_SESSION['role'] >= 1): ?>
  <form action="<?= BASE_URL ?>/crews/edit/<?= $crew->crewID ?>" method="POST" class="col-md-2">
    <button class="btn btn-primary btn-block">Edit</button>
  </form>
  <?php endif; ?>
  <?php if($_SESSION['role'] == 2): ?>
  <div class="col-md-2">
    <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#deleteConfirmModal">Delete</button>
  </div>

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
          <form action="<?= BASE_URL ?>/crews/delete/<?= $crew->crewID ?>" method="POST">
            <button type="submit" class="btn btn-primary btn-block">Delete</button>
          </form>
          <br>
          <button class="btn btn-primary btn-block" data-dismiss="modal" aria-label="Close">Cancel</button>
        </div>
        <div class="modal-footer">

        </div>
      </div>
    </div>
  </div>
  <?php endif; ?>
</div>

  <?php foreach($crew->soldiers as $s): ?>
    <div class="row my-1 pt-3 border-top">
      <div class="col-md-3">
        <img class="img-responsive w-100 mb-1" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" alt="<?= $s->last_name.", ".$s->first_name ?>" />
      </div>
      <div class="col-md-9">
        <h3><a href="<?= BASE_URL ?>/soldiers/view/<?= $s->id ?>"><?= $s->last_name.", ".$s->first_name ?></a></h3>
        <h3><?= $s->numToRank() ?></h3>
        <?php if(isset($s->birthday)): ?>
          <h4>Born: <?= $s->birthday ?></h4>
        <?php endif; ?>
        <?php if(isset($s->deathday)): ?>
          <h4>Died: <?= $s->deathday ?></h4>
        <?php endif; ?>
      </div>
    </div><!-- person row -->
  <?php endforeach; ?>
