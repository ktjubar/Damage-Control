<div class="row">
  <div class="col-md-7 p-2 px-3">
    <h3><?= $crew->name ?></h3><br>
    <h4><?= $crew->nick ?></h4><br>
    <p class="text-justify">Here's the description for this Crew! </p>

    <?php foreach($crew->soldiers as $s): ?>
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
  </div>

  <div class="col-sm-5 p-2 px-3">
    <div id="blueimp-gallery-carousel" class="blueimp-gallery blueimp-gallery-controls blueimp-gallery-carousel mb-2">
      <div class="slides"></div>
      <a class="prev"><i class="fa fa-arrow-left"></i></a>
      <a class="next"><i class="fa fa-arrow-right"></i></a>
      <a class="play-pause"><i class="fa fa-pause"></i></a>
      <ol class="indicator"></ol>
    </div>
  </div>
</div>

<div id="links">
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat1.jpg" title="Guy eating"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat2.jpg" title="Guy eating more"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat3.jpg" title="Guy eating even more"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat4.jpg" title="Guy eating less"></a>
</div>
