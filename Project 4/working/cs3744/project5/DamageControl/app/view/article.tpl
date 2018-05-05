<div class="row">
  <small class="col-12">
    Posted by
    <a href="<?= BASE_URL ?>/users/view/<?= $article->creator_id ?>/"><?= $article->creator_username ?></a>
    on <?= $article->date_created ?>
  </small>
</div>
<div class="row mb-4">
  <?php if($_SESSION['role'] > 1 || $_SESSION['username'] == $article->creator_username): ?>
  <form action="<?= BASE_URL ?>/articles/edit/<?= $article->id ?>" method="POST" class="col-2">
    <button class="btn btn-primary btn-block">Edit</button>
  </form>
  <?php endif; ?>
  <?php if($_SESSION['role'] == 2 || $_SESSION['username'] == $article->creator_username): ?>
  <div class="col-2">
    <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#deleteConfirmModal">Delete</button>
  </div>

  <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteConfirmModalLabel">Delete forever?</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="<?= BASE_URL ?>/articles/delete/<?= $article->id ?>" method="POST">
            <button type="submit" class="btn btn-primary btn-block">Delete</button>
          </form>
          <br>
          <button class="btn btn-primary btn-block" data-dismiss="modal" aria-label="Close">Cancel</button>
        </div>
        <div class="modal-footer">

        </div>
      </div>
    </div>
  </div>
  <?php endif; ?>
  <hr>
</div>

<div class="row">
  <div class="col-12 mt-3 mb-5 fr-view">
    <?= $article->body ?>
  </div>
</div>
