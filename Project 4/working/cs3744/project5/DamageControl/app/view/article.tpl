<div class="row">
  <small class="col-12">
    Posted by
    <a href="<?= BASE_URL ?>/users/view/<?= $article->creator_id ?>/"><?= $article->creator_username ?></a>
    on <?= $article->date_created ?>
    <hr>
  </small>
</div>

<div class="row">
  <div class="col-12 mt-3 mb-5 fr-view">
    <?= $article->body ?>
  </div>
</div>
