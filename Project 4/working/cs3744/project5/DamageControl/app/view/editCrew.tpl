<form action="<?= BASE_URL ?>/crews/add/process/" method="POST">
    <div class="row mb-4">
      <div class="col-md-7">
        <h5>Crew Number and Name: </h5><input type="number" name="id" required value="<?= $crew->crewID ?>" min="1">
        <input type="text" name="name" style="width: 300px;" required value="<?= $crew->name ?>" maxlength="100"><br><br>
        <h5>Crew Description: </h5>
        <textarea rows="10" cols="70"></textarea>
      </div>
      <div class="col-md-5">
        <?php $unassigned = Soldier::getUnassigned();
              if(!empty($unassigned)): ?>
          <h5>Select soldiers to add (hold CTRL to select multiple):</h5>
          <select class="w-100" name="soldiers[]" multiple>
            <?php foreach($unassigned as $s): ?>
              <option value="<?= $s->id ?>"><?= $s->last_name.", ".$s->first_name ?></option>
            <?php endforeach; ?>
          </select>
          
          <h5>Select soldiers to remove (hold CTRL to select multiple):</h5>
          <select class="w-100" name="remove[]" multiple>
            <?php foreach($crew->soldiers as $s): ?>
              <option value="<?= $s->id ?>"><?= $s->last_name.", ".$s->first_name ?></option>
            <?php endforeach; ?>
          </select>

        <?php endif; ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <button type="submit" class="btn btn-default btn-block" value="Edit">Add</button>
      </div>
    </form>
      <div class="col-md-6">
        <form action="<?= BASE_URL ?>/crews/">
            <button type="submit" class="btn btn-default btn-block" value="Cancel">Cancel</button>
        </form>
      </div>
    </div>
