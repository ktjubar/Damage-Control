  <?php include_once 'helper.php'; ?>

  <div class="row">
    <div class="col-10 mx-auto">
      <h3>Welcome to the <small><sup>(un)</sup></small>Official website for the 8th Air Force</h3>
      <p class="text-justify">This website holds all sorts of information on the bomber crews of the 8th Air Force
        and their members in World War II. After logging in and completing the brief account
        setup process, users can create and modify crew and soldier listings. You can also add
        other users as friends so you can see what kind of things they're doing!</p>

        <p class="text-justify">The Mighty Eighth Army Air Force began on 19 January 1942 and was activated on 28 January 1942
          at the Chatham Armory in Savannah, Georgia. Located at Hunter Field, Colonel Asa N. Duncan was
          the first commander. Pearl Harbor had just been bombed about a month and a half earlier.
          Brigadier General Ira C. Eaker took the Eighth Air Force Bomber Command Headquarters to England
          the next month and located at High Wycombe, about 40 miles west of London and on the road to Oxford.
          In May 1942 Command of the 8th Air Force was assumed by Major General Carl A. `Tooey' Spaatz.
          He established the 8th Air Force Headquarters at Bushy Park (Teddington, Middlesex), 15 miles
          west southwest of the center of London on 25 June 1942.

          Shortly after the birth of the 8th AAF at Savannah, one of our own, Joseph A. `Joe' Stenglein,
          1st Lieutenant and pilot in the 8th Bomber Command, was on his way to the United Kingdom .
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
      <div class="post-preview">
        <a href="post.html">
          <h2 class="post-title">
            Man must explore, and this is exploration at its greatest
          </h2>
          <h3 class="post-subtitle">
            Problems look mighty small from 150 miles up
          </h3>
        </a>
        <p class="post-meta">Posted by
          <a href="#">Start Bootstrap</a>
          on September 24, 2018</p>
      </div>
      <hr>
      <div class="post-preview">
        <a href="post.html">
          <h2 class="post-title">
            I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.
          </h2>
        </a>
        <p class="post-meta">Posted by
          <a href="#">Start Bootstrap</a>
          on September 18, 2018</p>
      </div>
      <hr>
      <div class="post-preview">
        <a href="post.html">
          <h2 class="post-title">
            Science has not yet mastered prophecy
          </h2>
          <h3 class="post-subtitle">
            We predict too much for the next year and yet far too little for the next ten.
          </h3>
        </a>
        <p class="post-meta">Posted by
          <a href="#">Start Bootstrap</a>
          on August 24, 2018</p>
      </div>
      <hr>
      <div class="post-preview">
        <a href="post.html">
          <h2 class="post-title">
            Failure is not an option
          </h2>
          <h3 class="post-subtitle">
            Many say exploration is part of our destiny, but it’s actually our duty to future generations.
          </h3>
        </a>
        <p class="post-meta">Posted by
          <a href="#">Start Bootstrap</a>
          on July 8, 2018</p>
      </div>
      <hr>
      <!-- Pager -->
      <div class="clearfix">
        <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
      </div>
    </div>

    <!-- Activity Feed -->
    <div class="col-lg-4 col-md-4 mx-auto">
      <?php if(isset($_SESSION['username'])): ?>
        <!-- User and Friends Feed -->
        <h4>Following Feed</h4>
        <p class="post-subtitle">Here are some of the things your friends have been up to!</p>
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
