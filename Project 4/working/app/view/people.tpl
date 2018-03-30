<div class="row">
  <div class="col-sm-9">
    <h3>Browse People</h3>
  </div>
  <div class="col-sm-3">
    <form method="get" action="<?= BASE_URL ?>/people/add/">
      <button class="btn btn-default btn-block button">Add Person</button>
    </form>
  </div>
</div>

<?php
  include_once '../utility.php';

  $con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
  if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

  $query = "SELECT * FROM person ORDER BY last_name, first_name ASC";
  $results = mysqli_query($con, $query);
  if ($results == false) {
    echo "Failed to query MySQL: " . $query;
  }
  while ($row = $results->fetch_assoc()) {
    // set file path for img tag, or none if file_name is null
    $file_path = "";
    if (!is_null($row['file_name'])) {
      $file_path = sprintf("src='../public/img/people/%s/%s'", strtolower($row['last_name']), $row['file_name']);
    } else {
      $file_path = "src='../public/img/ghost_person.png'";
    }

    // set birth string, or none if no birth information is specified
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

    // set death string, or none if no death information is specified
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
    if (!is_null($row['death_year'])) {
      $death_string .= $row['death_year'];
    }

    echo
    "<div class='row my-1 pt-3 border-top'>
      <div class='col-md-3'>
        <img class='img-responsive w-100 mb-1' " . $file_path . "
          alt='" . $row['first_name'] . " " . $row['last_name'] . "' />
      </div>
      <div class='col-md-9'>
        <h3><a href='" . BASE_URL . "/people/view/" . $row['id'] . "/'>" . $row['first_name'] . " " . $row['last_name'] . "</a></h3>
        <h4>" . $birth_string . "</h4>
        <h4>" . $death_string . "</h4>
        <p class='text-justify'>Summary will go here</p>
      </div>
    </div>";

    if (isset($_SESSION['username'])) {
      echo
      "<form action='" . BASE_URL . "/people/delete/" . $row['id'] . "'>
        <button class='btn btn-default' type='submit'>Delete</button>
      </form>";
    }
  }

  $con->close();
?>
