  <?php include_once 'helper.php'; ?>

  <div class="row px-1">
    <div class="col-md-8">
      <!-- main column -->
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
    <div class="col-md-4">
      <!-- activity feed -->
      <?php if(isset($_SESSION['username'])): ?>
        <!-- user + friends feed -->
        <h4>Following Feed</h4>
        <p class="text-justify">Here are some of the things your friends have been up to!</p>
        <div id="friendFeed" class="feed my-2 mx-1">
          <?php if(empty($fes)): ?>
            <p>No events yet.</p>
          <?php else: ?>
          <?php foreach($fes as $fe): ?>
            <div class="row p-2 border">
              <div class="col-12">
                <?= formatEvent($fe) ?>
              </div>
            </div>
          <?php endforeach; ?>
          <?php endif; ?>
        </div>
      <?php else: ?>
        <!-- global feed -->
        <h4>Global Feed</h4>
        <p class="text-justify">Here you can check out some of the things users have been doing!</p>
        <div id="globalFeed" class="feed my-2 mx-1">
          <?php if(empty($fes)): ?>
            <p>No events yet.</p>
          <?php else: ?>
          <?php foreach($fes as $fe): ?>
            <div class="row p-2 border">
              <div class="col-12">
                <?= formatEvent($fe) ?>
              </div>
            </div>
          <?php endforeach; ?>
          <?php endif; ?>
        </div>
      <?php endif; ?>
    </div>
  </div>
