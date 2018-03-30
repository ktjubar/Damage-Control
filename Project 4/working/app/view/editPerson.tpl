<?php
  include_once '../utility.php';

  $query = "SELECT * FROM person WHERE id='$personID'";
  $results = mysqli_query($con, $query);
  if ($results == false) {
    die("Failed to query MySQL: " . $query);
  }
  $row = $results->fetch_assoc();
?>

<form name="add-person" action="<?= BASE_URL ?>/people/edit/<?= $personID ?>/process/?" method="POST" autocomplete="off">
  <div class="row mb-4">
    <div class="col-md-3 mb-3">
      <h5>Fields marked with a <span style="color:red">*</span> are required.</h5><br>
      <!-- image -->
      Enter the name of the image to use (or leave blank for a placeholder):
      <input type="text" name="file_name" value="<?= $row['file_name'] ?>">
    </div>

    <div class="col-md-8 line-10">
      <!-- name, age, gender -->
      <span style="color:red">*</span> First name: <input type="text" name="first_name" value="<?= $row['first_name'] ?>"><br><br>
      Middle name: <input type="text" name="middle_name" value="<?= $row['middle_name'] ?>"><br><br>
      <span style="color:red">*</span> Last name: <input type="text" name="last_name" value="<?= $row['last_name'] ?>"><br><br>
      <span style="color:red">*</span> Age: <input type="number" name="age" min="1" value="<?= $row['age'] ?>"><br><br>
      <span style="color:red">*</span> Gender: <input type="text" name="gender" value="<?= $row['gender'] ?>"><br><br>
      <!-- birth day, month, year -->
      Birth day, month, and year (set to 0 if not known): <input type="number" name="birth_day" min="0" max="31" value="<?= $row['birth_day'] ?>">
      <input type="number" name="birth_month" min="0" max="12" value="<?= $row['birth_month'] ?>"> <input type="number" name="birth_year" min="0" value="<?= $row['birth_year'] ?>"><br><br>
      <!-- death day, month, year -->
      Death day, month, and year (set to 0 if not known): <input type="number" name="death_day" min="0" max="31" value="<?= $row['death_day'] ?>">
      <input type="number" name="death_month" min="0" max="12" value="<?= $row['death_month'] ?>"> <input type="number" name="death_year" min="0" value="<?= $row['death_year'] ?>">
      <input type="checkbox" name="alive"> Alive<br><br>
    </div>

    <div class="col-md-1">
      <input type="submit" class="btn btn-default btn-block button" value="Update">
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
    <div class="tab-pane fade show active mt-3 border-bottom" id="events" role="tabpanel" aria-labelledby="events-tab">
      <div class="row p-2">
        <h3>Finish creating the person to add life events!</h3>
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
</form>
