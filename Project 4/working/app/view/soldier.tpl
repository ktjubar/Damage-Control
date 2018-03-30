<div class="row mb-4">
  <div class="col-md-3">
    <!-- get img here -->
    <img class="img-responsive w-100" src="<?= BASE_URL ?>/public/img/soldiers/ghost_person.png" alt="firstname lastname" />
  </div>

  <div class="col-md-8">
    <h2><?= $s->last_name.", ".$s->first_name ?> rank rankimage</h2>
    <h3>birthdate</h3>
    <h3>deathdate</h3>
  </div>

  <div class="col-md-1">
    <form action="<?= BASE_URL ?>/people/edit/<?= $row['id'] ?>/">
      <button class="btn btn-default btn-block button">Edit</button>
    </form>
  </div>
</div>
