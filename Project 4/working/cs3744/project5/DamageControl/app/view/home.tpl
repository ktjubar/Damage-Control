  <div class="row px-1">
    <div class="col-md-8">
      <!-- main column -->
      <h3>Welcome to the <small><sup>(un)</sup></small>Official website for the 8th Air Force</h3>
      <p class="text-justify">This website holds all sorts of information on the bomber crews of the 8th Air Force
        and their members in World War II. After logging in and completing the brief account
        setup process, users can create and modify crew and soldier listings. You can also add
        other users as friends so you can see what kind of things they're doing!</p>
    </div>
    <div class="col-md-4">
      <!-- activity feed -->
      <?php if(isset($_SESSION['username'])): ?>
        <!-- user + friends feed -->
        <h4>Friend Feed</h4>
        <br>
        <div id="friendFeed" class="feed my-2 mx-1">
          something?
        </div>
      <?php else: ?>
        <!-- global feed -->
        <h4>Global Feed</h4>
        <p class="text-justify">Here you can check out some of the things users have been doing!</p>
        <div id="globalFeed" class="feed my-2 mx-1">

        </div>
      <?php endif; ?>
    </div>
  </div>
