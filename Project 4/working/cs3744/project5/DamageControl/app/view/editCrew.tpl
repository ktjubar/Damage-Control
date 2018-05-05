<form action="<?= BASE_URL ?>/crews/add/process/" method="POST">
    <div class="row mb-4">
      <div class="col-md-7">
        <h5>Crew Number and Name: </h5>
        <div class="form-group row">
          <div class="col-1"><span style="display:none;">nice</span></div>
          <input class="col-2" type="number" name="id" value="<?= $crew->crewID ?>" min="1" required>
          <div class="col-1"><span style="display:none;">nice</span></div>
          <input class="col-7" type="text" name="name" value="<?= $crew->name ?>" style="width: 300px;" maxlength="100" required>
        </div>
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
    <div class="row mb-4">
      <div class="col-12">
        <h5>Crew Description: </h5>
        <textarea id="crewDesc" class="w-100" name="description">
          <?= $crew->description ?>
        </textarea>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <button type="submit" class="btn btn-primary btn-block" value="Edit">Submit</button>
      </div>
    </form>
      <div class="col-md-6">
        <form action="<?= BASE_URL ?>/crews/view/<?= $crew->crewID ?>">
            <button type="submit" class="btn btn-primary btn-block" value="Cancel">Cancel</button>
        </form>
      </div>
    </div>
