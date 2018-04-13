<?php include_once 'view/helpers.php' ?>

<div id='activity_feed'>

  <h2>Recent Activities</h2>

  <?php if(empty($fes)): ?>
    <p>No events yet.</p>
  <?php else: ?>
  <ul>
  <?php foreach($fes as $fe): ?>
    <li><?= formatEvent($fe) ?></li>
  <?php endforeach; ?>
  </ul>
  <?php endif; ?>

</div>
