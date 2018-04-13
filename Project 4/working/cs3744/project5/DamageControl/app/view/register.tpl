<h3>Create New Account</h3>
<p>Fields marked with a <span class="text-red">*</span> are required.</p>

<form action="<?= BASE_URL ?>/users/registerProcess/" method="POST">
  <div class="row px-2 mx-2">
    <div class="col-md-5">
      <p><span class="text-red">*</span> E-mail Address:</p>
      <p><span class="text-red">*</span> Username:</p>
      <p><span class="text-red">*</span> Password:</p>
      <p><span class="text-red">*</span> First Name:</p>
      <p>Middle Name:</p>
      <p><span class="text-red">*</span> Last Name:</p>
      <p><span class="text-red">*</span> Gender:</p>
    </div>
    <div class="col-md-5">
      <input type="text" name="email" required>
      <input type="text" name="username" required>
      <input type="password" name="password" required>
      <input type="text" name="firstname" required>
      <input type="text" name="middlename" required>
      <input type="text" name="lastname">
      <select name="gender">
        <option value="0">Male</option>
        <option value="1">Female</option>
        <option value="2">Other</option>
      </select>
    </div>
  </div>
</form>

<p>Need The following $_POST:</p>
<p>username</p>
<p>password</p>
<p>firstname</p>
<p>lastname</p>
<p>middlename</p>
<p>gender</p>
<p>email</p>
<p>Submit to "BASEURL/users/registerProcess/"</p>
