<form action="<?= BASE_URL ?>/articles/add/process/<?= $a->id ?>/" method="POST">
  <div class="form-group row">
    <label class="col-3 col-form-label">
      Title:
    </label>
    <div class="col-9">
      <input class="form-control" type="text" name="title" maxlength="255" value="<?= $a->title ?>" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-3 col-form-label">
      Subtitle:
    </label>
    <div class="col-9">
      <input class="form-control" type="text" name="subtitle" maxlength="255" value="<?= $a->subtitle ?>">
    </div>
  </div>
  <div class="form-group row">
    <label class="col-3 col-form-label">
      Relevant Date (if applicable):
    </label>
    <div class="col-9">
      <input class="form-control" type="date" name="relevdate" value="<?= $a->relevant_date ?>">
    </div>
  </div>
  <div class="row mb-4">
    <div class="col-12">
      <h5>Article Body: </h5>
      <textarea id="articleBody" class="w-100" name="body" required>
        <?= $a->body ?>
      </textarea>
    </div>
  </div>
  <div class="row">
    <div class="col-6">
      <button type="submit" class="btn btn-primary btn-block" value="Edit">Submit</button>
    </div>
  </form>
    <div class="col-6">
      <form action="<?= BASE_URL ?>/articles/">
          <button type="submit" class="btn btn-primary btn-block" value="Cancel">Cancel</button>
      </form>
    </div>
  </div>
