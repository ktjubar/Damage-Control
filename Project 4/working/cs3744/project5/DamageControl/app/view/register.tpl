<h3>Create New Account</h3>
<p>Fields marked with a <span class="text-red">*</span> are required.</p>

<form action="<?= BASE_URL ?>/users/registerProcess/" method="POST">
  <div class="form-group row">
    <label class="col-2 col-form-label">
      <span class="text-red">*</span> E-mail Address:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="email" maxlength="100" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      <span class="text-red">*</span> Username:
    </label>
    <div class="col-7">
      <input id="registerUsername" class="form-control" type="text" name="username" maxlength="40" required>
      <img src="<?= BASE_URL ?>/public/img/loadinggif.gif" id="loaderIcon" style="display:none;width:20px;height:20px" />
      <div id="takenUsername" class="form-control-feedback" style="display:none">Username is taken.</div>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      <span class="text-red">*</span> Password:
    </label>
    <div class="col-7">
      <input class="form-control" type="password" name="password" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      <span class="text-red">*</span> First Name:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="firstname" maxlength="100" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      Middle Name:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="middlename" maxlength="100">
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      <span class="text-red">*</span> Last Name:
    </label>
    <div class="col-7">
      <input class="form-control" type="text" name="lastname" maxlength="100" required>
    </div>
  </div>
  <div class="form-group row">
    <label class="col-2 col-form-label">
      <span class="text-red">*</span> Gender:
    </label>
    <div class="col-7">
      <select class="form-control" name="gender">
        <option value="0">Male</option>
        <option value="1">Female</option>
        <option value="2" selected>Other</option>
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-2">
      <button type="submit" class="btn btn-default btn-block">Register</button>
    </div>
  </div>
</form>
