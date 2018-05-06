<!-- Temporary graphics link -->
<div id="visualization" class="mb-4"></div>

<script type="text/javascript">
  // DOM element where the Timeline will be attached
  var container = document.getElementById('visualization');

  // Create a DataSet (allows two way data-binding)
  var items = new vis.DataSet([
    {id: 1, content: 'Changes After the Raid', start: '1943-10-14'},
    {id: 2, content: 'From the Ashes', start: '1943-11-01'},
    {id: 3, content: 'Strike Back', start: '1944-04-01'}
  ]);

  // Configuration for the Timeline
  var options = {
    editable: true
  };

  // Create a Timeline
  var timeline = new vis.Timeline(container, items, options);
</script>

<div class="row">
  <div class="col-9">
  </div>
  <div class="col-3">
    <?php if($_SESSION['role'] >= 1): ?>
    <form method="get" action="<?= BASE_URL ?>/articles/add/">
      <button class="btn btn-primary btn-block button">Add Article</button>
    </form>
    <?php endif; ?>
  </div>
</div>

<hr>

<div class="row">
  <!-- Articles -->
  <div class="col-12 mx-auto pb-3">
    <?php foreach($articles as $a): ?>
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
        <a href="<?= BASE_URL ?>/users/view/<?= $a->creator_id ?>/"><?= $a->creator_username ?></a>
        on <?= $a->date_created ?></p>
    <hr>
    </div>
    <?php endforeach; ?>
    <!-- Pager -->
    <div class="clearfix">
    </div>
  </div>
</div>
