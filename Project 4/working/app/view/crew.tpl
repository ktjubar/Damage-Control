<div class="row">
  <div class="col-md-7 p-2 px-3">
    <h3><?= $crew->name ?></h3><br>
    <h4><?= $crew->nick ?></h4><br>
    <p class="text-justify">WELCOME TO FLAVORTOWN! The Fieris are a fun, food-loving
      family that love to take road trips looking for America’s greatest diners,
      drive-ins, and dives. They pack their suitcases into Guy's cherry-red
      vintage Camaro and explore the country having amazing food and fun.</p>

    <div class="row my-1 pt-3 border-top">
      <div class="col-md-3">
        <img class="img-responsive w-100 mb-1" src="<?= BASE_URL ?>/public/img/people/fieri/guy.jpg" alt="Guy Fieri" />
      </div>
      <div class="col-md-9">
        <h3><a href="<?= BASE_URL ?>/people/">Guy Fieri</a></h3>
        <h4>Born: 22 Jan. 1968</h4>
        <p class="text-justify">Guy has frosted tips. This is his most defining attribute,
          other than the fact that he loves to shove food into his piehole. He goes
          to restaurants on TV and helps them cook their signature dishes, then
          jam-packs food into his gullet. When not filling his stomach, Guy enjoys
          long walks on the beach with piña coladas and getting caught in the rain.
          He also enjoys spending time with his wife and kids.</p>
      </div>
    </div><!-- person row -->
  </div>

  <div class="col-sm-5 p-2 px-3">
    <div id="blueimp-gallery-carousel" class="blueimp-gallery blueimp-gallery-controls blueimp-gallery-carousel mb-2">
      <div class="slides"></div>
      <a class="prev"><i class="fa fa-arrow-left"></i></a>
      <a class="next"><i class="fa fa-arrow-right"></i></a>
      <a class="play-pause"><i class="fa fa-pause"></i></a>
      <ol class="indicator"></ol>
    </div>

    <div class="int-tree-prev text-center">
      <img class="img-responsive w-100 p-2" src="<?= BASE_URL ?>/public/img/people/fieri/tree.jpg" alt="Family tree preview" />
      <button class="btn m-1 button">Launch Interactive Tree</button>
    </div>
  </div>
</div>

<div id="links">
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat1.jpg" title="Guy eating"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat2.jpg" title="Guy eating more"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat3.jpg" title="Guy eating even more"></a>
  <a href="<?= BASE_URL ?>/public/img/people/fieri/gallery/eat4.jpg" title="Guy eating less"></a>
</div>
