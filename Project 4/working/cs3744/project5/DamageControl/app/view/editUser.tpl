<img class="rounded mx-auto mb-4 d-block" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" />
<h4 class="text-center"><?= $user->username ?></h4><br>
<form action="<?= BASE_URL ?>/users/registerProcess/<?= $user->id ?>/" method="POST">
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
  <br>
  <button class="btn btn-primary" type="submit">Submit</button>
</form><br>
<form action="<?= BASE_URL ?>/users/view/<?= $user->id ?>/" method="POST">
  <button class="btn btn-primary" type="submit">Cancel</button>
</form>
