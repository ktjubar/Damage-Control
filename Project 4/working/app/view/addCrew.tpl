<form action="<?= BASE_URL ?>/crews/add/process/" method="POST">
  <div class="row mb-4">
    <div class="col-md-12">
      <h5>Crew Number: </h5><input type="number" name="id" required>
      <input type="text" name="name" placeholder="Crew name (including number)" style="width: 300px;" required>
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
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <button type="submit" class="btn btn-default btn-block" value="Add">Add</button>
    </div>
  </form>
    <div class="col-md-6">
      <form action="<?= BASE_URL ?>/crews/">
          <button type="submit" class="btn btn-default btn-block" value="Cancel">Cancel</button>
      </form>
    </div>
  </div>

<p>
  Back end needs the following in POST:
  <br>
  $name = $_POST['name']; //required
  <br>
  $soldiers = $_POST[array]; //???
</p>
