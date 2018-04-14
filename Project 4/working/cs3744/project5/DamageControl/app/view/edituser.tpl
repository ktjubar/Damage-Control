<?php include 'helper.php'; ?>

<img class="rounded mx-auto mb-4 d-block" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" />
<form action="<?= BASE_URL ?>/users/registerProcess/<?= $user->id ?>/" method="POST">
  <input type="text" name="firstname" value="<?= $user->firstname ?>" required>
  <input type="text" name="middlename" value="<?= $user->middlename ?>">
  <input type="text" name="lastname" value="<?= $user->lastname ?>" required>
  <select>
    <option value="0">Male</option>
    <option value="1">Female</option>
    <option value="2">Other</option>
  </select>
  <br><br>
  <h4><?= $user->username ?></h4><br>
  <button class="btn btn-default" type="submit">Submit</button>
</form><br>
<form action="<?= BASE_URL ?>/users/view/<?= $user->id ?>/" method="POST">
  <button class="btn btn-default" type="submit">Cancel</button>
</form>
<div class="row border-top mt-4">
</div>
