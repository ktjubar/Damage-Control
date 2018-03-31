<form action="<?= BASE_URL ?>/soldiers/add/process/" method="POST">
  <div class="row mb-4">
    <div class="col-md-3">
      <!-- get img here -->
      <img class="img-responsive w-100" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" alt="<?= $s->last_name.", ".$s->first_name ?>" />
    </div>

    <div class="col-md-8">
      <input type="text" placeholder="First name" name="first" required>
      <input type="text" placeholder="Last name" name="last" required>
      <select name="rank">
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
      <h5>Born: </h5><input type="date" name="dob"><br><br>
      <h5>Died: </h5><input type="date" name="dod"><br>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <button type="submit" class="btn btn-default btn-block" value="Add">Add</button>
    </div>
  </form>
    <div class="col-md-6">
      <form action="<?= BASE_URL ?>/soldiers/">
          <button type="submit" class="btn btn-default btn-block" value="Cancel">Cancel</button>
      </form>
    </div>
  </div>
