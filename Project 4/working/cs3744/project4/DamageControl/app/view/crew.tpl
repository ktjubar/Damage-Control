<div class="row">
  <div class="col-md-11 p-2 px-3">
    <h3><?= $crew->name ?>
    <?php if(isset($crew->nick)): ?>
      <small>- <?= $crew->nick ?></small>
    <?php endif; ?></h3>
    <p class="text-justify">Here's the description for this Crew!</p>
  </div>

  <div class="col-md-1">
    <form action="<?= BASE_URL ?>/crews/edit/<?= $crew->crewID ?>">
      <button class="btn btn-default btn-block button">Edit</button>
    </form>
    <br>
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
            <form action="<?= BASE_URL ?>/crews/delete/<?= $crew->crewID ?>" method="POST">
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
  </div>

  <!-- <div class="col-sm-5 p-2 px-3">
    <div id="blueimp-gallery-carousel" class="blueimp-gallery blueimp-gallery-controls blueimp-gallery-carousel mb-2">
      <div class="slides"></div>
      <a class="prev"><i class="fa fa-arrow-left"></i></a>
      <a class="next"><i class="fa fa-arrow-right"></i></a>
      <a class="play-pause"><i class="fa fa-pause"></i></a>
      <ol class="indicator"></ol>
    </div>
  </div> -->
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

<!-- <div id="links">
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat1.jpg" title="Guy eating"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat2.jpg" title="Guy eating more"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat3.jpg" title="Guy eating even more"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat4.jpg" title="Guy eating less"></a>
</div> -->
