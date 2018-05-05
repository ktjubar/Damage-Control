<!-- Temporary graphics link -->
<div class="row mb-4">
  <div class="col-12">
    <a href="<?= BASE_URL ?>/graphic/">Graphics are here</a>
  </div>
</div>
<hr class="mb-4">

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
    </div>
    <hr>
    <?php endforeach; ?>
    <!-- Pager -->
    <div class="clearfix">
      <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
    </div>
  </div>
</div>
