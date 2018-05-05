<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SoldierController and route it
$sc = new PersonController();
$sc->route($action);

class PersonController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'view':
				$id = $_GET['id'];
				$this->view($id);
				break;

			case 'index':
				$this->index();
				break;

			case 'add':
				$this->add();
				break;

			case 'addProcess':
				$this->addProcess();
				break;

			case 'addLifeEventProcess':
				$id = $_GET['id'];
				$this->addLifeEventProcess($id);
				break;

			case 'deleteProcess':
				$id = $_GET['id'];
				$this->deleteProcess($id);
				break;

			case 'edit':
				$id = $_GET['id'];
				$this->edit($id);
				break;

			case 'editProcess':
				$id = $_GET['id'];
				$this->editProcess($id);
				break;
		}

	}

	public function view($id) {
		$pageTitle = 'Person';
		$category = 'people';
		include_once SYSTEM_PATH.'/view/header.tpl';

		$con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
	  if (mysqli_connect_errno()) {
	    echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }

		$query = "SELECT * FROM person WHERE id='$id'";
		$results = mysqli_query($con, $query);

		if($results == false) {
			die('Invalid person ID');
			// echo "Invalid person ID";
		} else {
			include_once SYSTEM_PATH.'/view/person.tpl';
		}

		include_once SYSTEM_PATH.'/view/footer.tpl';

		$con->close();
  }

	public function index() {
		$pageTitle = 'People';
		$category = 'people';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/people.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function add() {
		$pageTitle = 'Add Person';
		$category = 'people';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/addPerson.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addProcess() {
		if (!isset($_SESSION['username'])) {
			include_once SYSTEM_PATH.'/view/header.tpl';
			echo "<h3>Please log in to do that!</h3>";
			include_once SYSTEM_PATH.'/view/footer.tpl';
			exit();
		}

		// get POST variables
		$new_filename = $_POST['file_name'];
		$new_firstname = $_POST['first_name'];
		$new_middlename = $_POST['middle_name'];
		$new_lastname = $_POST['last_name'];
		$new_age = $_POST['age'];
		$new_gender = $_POST['gender'];
		$new_birthday = $_POST['birth_day'];
		$new_birthmonth = $_POST['birth_month'];
		$new_birthyear = $_POST['birth_year'];
		$new_deathday = $_POST['death_day'];
		$new_deathmonth = $_POST['death_month'];
		$new_deathyear = $_POST['death_year'];

		// create query, uses 1 as creator id for now
		$con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
	  if (mysqli_connect_errno()) {
	    echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }

		$add_query = sprintf("INSERT INTO person VALUES (NULL, '%s', ", $new_firstname);
		if (!empty($new_middlename)) {
			$add_query .= "'" . $new_middlename . "'" . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		$add_query .= "'" . $new_lastname . "'" . ", ";
		if (!empty($new_birthday)) {
			$add_query .= $new_birthday . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		if (!empty($new_birthmonth)) {
			$add_query .= $new_birthmonth . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		if (!empty($new_birthyear)) {
			$add_query .= $new_birthyear . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		if (!empty($new_deathday)) {
			$add_query .= $new_deathday . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		if (!empty($new_deathmonth)) {
			$add_query .= $new_deathmonth . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		if (!empty($new_deathyear)) {
			$add_query .= $new_deathyear . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		$add_query .= $new_age . ", ";
		$add_query .= "'" . $new_gender . "'" . ", ";
		if (!empty($new_filename)) {
			$add_query .= "'" . $new_filename . "'" . ", ";
		} else {
			$add_query .= "NULL, ";
		}
		$add_query .= "NULL, 1)";

		$success = mysqli_query($con, $add_query);

		if ($success === FALSE) {
			die("Failed to add record to database" . $con->error);
		}

		$con->close();

		header('Location: ' . BASE_URL . '/people/'); exit();
	}

	public function addLifeEventProcess($personID, $creatorID) {
		// get POST variables

		// check required fields

		// check valid values

		// add event to db
	}

	public function deleteProcess($personID) {
		if (!isset($_SESSION['username'])) {
			include_once SYSTEM_PATH.'/view/header.tpl';
			echo "<h3>Please log in to do that!</h3>";
			include_once SYSTEM_PATH.'/view/footer.tpl';
			exit();
		}

		$con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
	  if (mysqli_connect_errno()) {
	    echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }

		$del_query = sprintf("DELETE FROM person WHERE id = '%d'", $personID);

		$success = mysqli_query($con, $del_query);

		if ($success === FALSE) {
			die("Failed to add record to database" . $con->error);
		}

		$con->close();

		header('Location: ' . BASE_URL . '/people/'); exit();
	}

	public function edit($personID) {
		$pageTitle = 'Edit Person';
		$category = 'people';
		include_once SYSTEM_PATH.'/view/header.tpl';

		$con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
	  if (mysqli_connect_errno()) {
	    echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }

		$query = "SELECT * FROM person WHERE id='$personID'";
		$results = mysqli_query($con, $query);

		if($results == false) {
			die('Invalid person ID');
			// echo "Invalid person ID";
		} else {
			include_once SYSTEM_PATH.'/view/editPerson.tpl';
		}
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProcess($personID) {
		if (!isset($_SESSION['username'])) {
			include_once SYSTEM_PATH.'/view/header.tpl';
			echo "<h3>Please log in to do that!</h3>";
			include_once SYSTEM_PATH.'/view/footer.tpl';
			exit();
		}

		// get POST variables
		$new_filename = $_POST['file_name'];
		$new_firstname = $_POST['first_name'];
		$new_middlename = $_POST['middle_name'];
		$new_lastname = $_POST['last_name'];
		$new_age = $_POST['age'];
		$new_gender = $_POST['gender'];
		$new_birthday = $_POST['birth_day'];
		$new_birthmonth = $_POST['birth_month'];
		$new_birthyear = $_POST['birth_year'];
		$new_deathday = $_POST['death_day'];
		$new_deathmonth = $_POST['death_month'];
		$new_deathyear = $_POST['death_year'];

		// create query, uses 1 as creator id for now
		$con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
	  if (mysqli_connect_errno()) {
	    echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }

		$edit_query = "UPDATE person SET first_name = '" . $new_firstname . "', ";
		if (!empty($new_middlename)) {
			$edit_query .= "middle_name = '" . $new_middlename . "'" . ", ";
		} else {
			$edit_query .= "middle_name = NULL, ";
		}
		$edit_query .= "last_name = '" . $new_lastname . "'" . ", ";
		if (!empty($new_birthday)) {
			$edit_query .= "birth_day = " . $new_birthday . ", ";
		} else {
			$edit_query .= "birth_day = NULL, ";
		}
		if (!empty($new_birthmonth)) {
			$edit_query .= "birth_month = " . $new_birthmonth . ", ";
		} else {
			$edit_query .= "birth_month = NULL, ";
		}
		if (!empty($new_birthyear)) {
			$edit_query .= "birth_year = " . $new_birthyear . ", ";
		} else {
			$edit_query .= "birth_year = NULL, ";
		}
		if (!empty($new_deathday)) {
			$edit_query .= "death_day = " . $new_deathday . ", ";
		} else {
			$edit_query .= "death_day = NULL, ";
		}
		if (!empty($new_deathmonth)) {
			$edit_query .= "death_month = " . $new_deathmonth . ", ";
		} else {
			$edit_query .= "death_month = NULL, ";
		}
		if (!empty($new_deathyear)) {
			$edit_query .= "death_year = " . $new_deathyear . ", ";
		} else {
			$edit_query .= "death_year = NULL, ";
		}
		$edit_query .= "age = " . $new_age . ", ";
		$edit_query .= "gender = '" . $new_gender . "'" . ", ";
		if (!empty($new_filename)) {
			$edit_query .= "file_name = '" . $new_filename . "'";
		} else {
			$edit_query .= "file_name = NULL";
		}
		$edit_query .= " WHERE id = " . $personID . ";";

		echo $edit_query;

		$success = mysqli_query($con, $edit_query);

		if ($success === FALSE) {
			die("Failed to edit record in database " . $con->error);
		}

		$con->close();

		header('Location: ' . BASE_URL . `/people/view/$personID/`); exit();
	}
}
