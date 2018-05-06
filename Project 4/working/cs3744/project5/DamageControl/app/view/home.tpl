<?php include_once 'helper.php'; ?>

  <div class="row">
    <div class="col-10 mx-auto">
      <h3>Welcome to the <small><sup>(un)</sup></small>Official website for the 8th Air Force</h3>
      <p class="text-justify">This website holds all sorts of information on the bomber crews of the 8th Air Force
        and their members in World War II. After registering and loggin in, users can create and modify crew and
        soldier listings. You can also add other users as friends so you can see what kind of things they're doing!</p>

        <p class="text-justify">The Mighty Eighth Army Air Force began on 19 January 1942 and was activated on 28 January 1942
          at the Chatham Armory in Savannah, Georgia. Located at Hunter Field, Colonel Asa N. Duncan was
          the first commander. Pearl Harbor had just been bombed about a month and a half earlier.
          Brigadier General Ira C. Eaker took the Eighth Air Force Bomber Command Headquarters to England
          the next month and located at High Wycombe, about 40 miles west of London and on the road to Oxford.
          In May 1942 Command of the 8th Air Force was assumed by Major General Carl A. `Tooey' Spaatz.
          He established the 8th Air Force Headquarters at Bushy Park (Teddington, Middlesex), 15 miles
          west southwest of the center of London on 25 June 1942.

          Shortly after the birth of the 8th AAF at Savannah, one of our own, Joseph A. `Joe' Stenglein,
          1st Lieutenant and pilot in the 8th Bomber Command, was on his way to the United Kingdom.
          He was in charge of 1,000 officers and men making the transition from Georgia into the United
          Kingdom as staff for the 8th Air Force. Joe knew the High Wycombe Abbey well as the main
          Headquarters building of the 8th AAF. There were times when socially he was over at Maidenhead
          in the home of a British governmental minister with Joe's friend, Pleasant J. McNeel. McNeel later,
          as did Joe, joined the staff of the 325th Recon Wing. Joe served at the Widewing headquarters
          in the London area and then became Commanding Officer of the organization which was to become
          the 25th Bomb Group at Watton, north of London.</p>
    </div>
  </div>

  <hr class="pb-5">

  <div class="row">
    <!-- Articles -->
    <div class="col-lg-8 col-md-10 mx-auto pb-3">
      <?php for($i = 0; $i < (sizeof($articles) < 5 ? sizeof($articles) : 5); $i++):
            $a = $articles[$i] ?>
      <div class="post-preview">
        <a href="<?= BASE_URL ?>/articles/view/<?= $a->id ?>/">
          <h2 class="post-title">
            <?= $a->title ?>
          </h2>
          <h3 class="post-subtitle">
            <?= $a->subtitle ?>
          </h3>
        </a>
        <p class="post-meta">Posted by
          <a href="<?= BASE_URL ?>/users/view/<?= $a->creator_id ?>"><?= $a->creator_username ?></a>
          on <?= $a->date_created ?></p>
      </div>
      <hr>
      <?php endfor; ?>
      <!-- Pager -->
      <div class="clearfix">
        <small class="text-right">This might be only the first few articles, see the articles page for more!</small>
      </div>
    </div>

    <!-- Activity Feed -->
    <div class="col-lg-4 col-md-4 mx-auto">
      <?php if(isset($_SESSION['username'])): ?>
        <!-- User and Friends Feed -->
        <h4>Following Feed</h4>
        <p class="post-subtitle">Here are some of the things your friends have been up to!</p>
        <hr>
        <div id="friendFeed" class="feed my-2 mx-1">
          <?php if(empty($fes)): ?>
            <p>No events yet.</p>
          <?php else: ?>
          <?php foreach($fes as $fe): ?>
            <div class="row p-2">
              <div class="col-12">
                <?= formatEvent($fe) ?>
              </div>
            </div>
            <hr>
          <?php endforeach; ?>
          <?php endif; ?>
        </div>
      <?php else: ?>
        <!-- Global Feed -->
        <h4>Global Feed</h4>
        <p class="post-subtitle">Here you can check out some of the things users have been doing!</p>
        <hr>
        <div id="globalFeed" class="feed my-2 mx-1">
          <?php if(empty($fes)): ?>
            <p>No events yet.</p>
          <?php else: ?>
          <?php foreach($fes as $fe): ?>
            <div class="row p-2">
              <div class="col-12">
                <?= formatEvent($fe) ?>
              </div>
            </div>
            <hr>
          <?php endforeach; ?>
          <?php endif; ?>
        </div>
      <?php endif; ?>
    </div>
  </div>
