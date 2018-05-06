<img class="rounded mx-auto mb-4 d-block" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" />
<h4 class="text-center"><?= $user->username ?></h4><br>
<form action="<?= BASE_URL ?>/users/registerProcess/<?= $user->id ?>/" method="POST" enctype="multipart/form-data">
  <div class="form-group row">
    <label clss="col-2 col-form-label">
      Profile Picture:
    </label>
    <div class="col-7">
      <input id="profpic" type="file" name="profpic">
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      First Name:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="firstname" maxlength="100" value="<?= $user->firstname ?>" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      Middle Name:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="middlename" maxlength="100" value="<?= $user->middlename ?>" >
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      Last Name:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="lastname" maxlength="100" value="<?= $user->lastname ?>" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      Gender:
    </label>
    <div class="col-7">
      <select class="form-control" name="gender">
        <option value="0">Male</option>
        <option value="1">Female</option>
        <option value="2" selected>Other</option>
      </select>
    </div>
  </div>
  <div class="row mb-4">
    <div class="col-12">
      User Description:
      <textarea id="userDesc" class="w-100" name="description">
        <?= $user->description ?>
      </textarea>
    </div>
  </div>
  <div class="row">
    <div class="col-6">
      <button class="btn btn-primary btn-block" type="submit">Submit</button>
    </div>
    </form>
    <div class="col-6">
      <form action="<?= BASE_URL ?>/users/view/<?= $user->id ?>/" method="POST">
        <button class="btn btn-primary btn-block" type="submit">Cancel</button>
      </form>
    </div>
  </div>
