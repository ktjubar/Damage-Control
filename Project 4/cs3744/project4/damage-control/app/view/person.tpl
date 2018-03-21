<?php
  include_once '../utility.php';

  $query = "SELECT * FROM person WHERE id='$id'";
  $results = mysqli_query($con, $query);
  if ($results == false) {
    die("Failed to query MySQL: " . $query);
  }
  $row = $results->fetch_assoc();
?>

<div class="row mb-4">
  <div class="col-md-3">
    <?php
      $file_path = "";
      if (!is_null($row['file_name'])) {
        $file_path = sprintf("people/%s/%s", strtolower($row['last_name']), $row['file_name']);
      } else {
        $file_path = "ghost_person.png";
      }
    ?>
    <img class="img-responsive w-100" src="<?= BASE_URL ?>/public/img/<?= $file_path ?>" alt="<?= $row['first_name'] ?> <?= $row['last_name'] ?>" />
  </div>

  <div class="col-md-8">
    <h2><?= $row['first_name'] ?> <?= $row['middle_name'] ?> <?= $row['last_name'] ?>, <?= $row['age'] ?>, <?= $row['gender'] ?></h2>
    <?php
      $birth_string = "";
      if (!is_null($row['birth_day']) || !is_null($row['birth_month']) || !is_null($row['birth_year'])) {
        $birth_string .= "Born: ";
      }
      if (!is_null($row['birth_day'])) {
        $birth_string .= $row['birth_day'];
        $birth_string .= " ";
      }
      if (!is_null($row['birth_month'])) {
        $birth_string .= Utility::get_month_string($row['birth_month']);
        $birth_string .= " ";
      }
      if (!is_null($row['birth_year'])) {
        $birth_string .= $row['birth_year'];
      }
    ?>
    <h3><?= $birth_string ?></h3>
    <?php
      $death_string = "";
      if (!is_null($row['death_day']) || !is_null($row['death_month']) || !is_null($row['death_year'])) {
        $death_string .= "Died: ";
      }
      if (!is_null($row['death_day'])) {
        $death_string .= $row['death_day'];
        $death_string .= " ";
      }
      if (!is_null($row['death_month'])) {
        $death_string .= Utility::get_month_string($row['death_month']);
        $death_string .= " ";
      }
    ?>
    <h3><?= $death_string ?></h3>
  </div>

  <div class="col-md-1">
    <form action="<?= BASE_URL ?>/people/edit/<?= $row['id'] ?>/">
      <button class="btn btn-default btn-block button">Edit</button>
    </form>
  </div>
</div>

<ul class="nav nav-tabs justify-content-center" id="personTabs" role="tablist">
  <li class="nav-item">
    <a class="nav-link" id="summary-tab" data-toggle="tab" href="#summary" role="tab" aria-controls="summary" aria-selected="false">Summary</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" id="events-tab" data-toggle="tab" href="#events" role="tab" aria-controls="events" aria-selected="true">Important Events</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="family-tab" data-toggle="tab" href="#family" role="tab" aria-controls="family" aria-selected="false">Family</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="tree-tab" data-toggle="tab" href="#tree" role="tab" aria-controls="tree" aria-selected="false">Interactive Tree</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="documents-tab" data-toggle="tab" href="#documents" role="tab" aria-controls="documents" aria-selected="false">Documents</a>
  </li>
</ul>
<div class="tab-content" id="personTabContent">
  <!-- summary -->
  <div class="tab-pane fade mt-3 border-bottom" id="summary" role="tabpanel" aria-labelledby="summary-tab">
    <div class="row p-2">
      <div class="col-md-6 px-3">
        <h3>This part has not yet been implemented!</h3>
      </div>
    </div>
  </div>
  <!-- end summary -->

  <!-- important events -->
  <?php
    $query = "SELECT * FROM important_event WHERE person_id='$id'";
    $results = mysqli_query($con, $query);
    if ($results == false) {
      die("Failed to query MySQL: " . $query);
    }
  ?>
  <div class="tab-pane fade show active mt-3 border-bottom" id="events" role="tabpanel" aria-labelledby="events-tab">
    <div class="row p-2">
      <?php
        if (mysqli_num_rows($results) <= 0) {
          echo "No life events to show";
        } else {
          while ($row = $results->fetch_assoc()) {
            // create date string
            $date_string = $row['year'];
            if (!is_null($row['month'])) {
              $date_string = Utility::get_month_string($row['month']) . " " . $date_string;
            }
            if (!is_null($row['day'])) {
              $date_string = $row['day'] . " " . $date_string;
            }

            echo
            "<div class='col-md-4 px-3'>
              <h3>" . $row['title'] . "</h3>
              <h4>" . $date_string . "</h4>
              <p class='text-justify'>" . $row['details'] . "</p>
            </div>";
          }
        }
      ?>
    </div>
  </div>
  <!-- end events -->

  <!-- family -->
  <div class="tab-pane fade my-3 border-bottom" id="family" role="tabpanel" aria-labelledby="family-tab">
    <h3>This part has not yet been implemented!</h3>
  </div>
  <!-- end family -->

  <!-- family tree -->
  <div class="tab-pane fade mt-3 border-bottom" id="tree" role="tabpanel" aria-labelledby="tree-tab">
    <h3>This part has not yet been implemented!</h3>
    <div class="int-tree-prev text-center pb-2">
      <img class="img-responsive w-100 p-2" src="<?= BASE_URL ?>/public/img/people/fieri/tree.jpg" alt="Family tree preview" />
      <button class="btn m-1 button">Launch Interactive Tree</button>
    </div>
  </div>
  <!-- end tree -->

  <!-- documents -->
  <div class="tab-pane fade my-3 pb-3 border-bottom" id="documents" role="tabpanel" aria-labelledby="documents-tab">
    <h3>This part has not yet been implemented!</h3>
  </div>
  <!-- end documents -->
</div>
