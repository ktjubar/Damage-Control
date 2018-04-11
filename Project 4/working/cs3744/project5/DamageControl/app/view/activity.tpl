<div id='activity_feed'>

  <h2>Recent Activities</h2>

  <?php foreach($fes as $fe): ?>
    <li><?= $fe->type ?></li>
    <li><?= $fe->soldier_name ?></li>
  <?php endforeach; ?>
  
</div>
