<form action="<?= BASE_URL ?>/soldiers/add/process/<?= $s->id ?>" method="POST">
  <div class="row mb-4">
    <div class="col-md-3">
      <!-- get img here -->
      <img class="img-responsive w-100" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" alt="<?= $s->last_name.", ".$s->first_name ?>" />
    </div>

    <div class="col-md-8">
      <input type="text" placeholder="First name" name="first" value="<?= $s->first_name ?>" required>
      <input type="text" placeholder="Last name" name="last" value="<?= $s->last_name ?>" required>
      <select name="rank" selected="<?= $s->rank ?>">
        <option value="1">2nd Lieutenant</option>
        <option value="2">1st Lieutenant</option>
        <option value="3">Captain</option>
        <option value="4">Major</option>
        <option value="5">Lieutenant Colonel</option>
        <option value="6">Colonel</option>
        <option value="7">Brigadier General</option>
        <option value="8">Major General</option>
        <option value="9">Lieutenant General</option>
        <option value="10">General</option>
      </select><br><br>
      <h5>Born (leave blank if unknown): </h5><input type="date" name="dob" value="<?= $s->birthday ?>"><br><br>
      <h5>Died (leave blank if unknown): </h5><input type="date" name="dod" value="<?= $s->deathday ?>"><br>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <button type="submit" class="btn btn-default btn-block" value="Edit">Edit</button>
    </div>
  </form>
    <div class="col-md-6">
      <form action="<?= BASE_URL ?>/soldiers/view/<?= $s->id ?>">
          <button type="submit" class="btn btn-default btn-block" value="Cancel">Cancel</button>
      </form>
    </div>
  </div>
