<div class="row">
  <div class="col-sm-9">
    <h3>Browse Soldiers</h3>
  </div>
  <div class="col-sm-3">
    <?php if(isset($_SESSION['username'])): ?>
    <form method="get" action="<?= BASE_URL ?>/crews/add/">
      <button class="btn btn-default btn-block button">Add Crew</button>
    </form>
    <?php endif; ?>
  </div>
</div>
