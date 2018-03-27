<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SoldierController and route it
$sc = new FamilyController();
$sc->route($action);

class FamilyController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'view':
        // $name = $_GET['name']; // get the soldier name
				$id = $_GET['id'];
				$this->view($id);
				break;

			case 'family':
				$this->family();
				break;

			case 'add':
				$this->add();
				break;

			case 'addProcess':
				$id = 0;	
				if(isset($_GET['id'])) {
					$id = $_GET['id'];
				}
				$this->addProcess($id);
				break;

			case 'addLifeEventProcess':
				$id = $_GET['id'];
				$this->addLifeEventProcess($id);
				break;

			case 'edit':
				$id = $_GET['id'];
				$this->displayEdit($id);
				break;
		}

	}

	public function view($id) {
		$person = Person::loadById($id);
		if($person != null) {
			//$lifeEvents = LifeEvent::getBySoldierId($id);
			$pageTitle = $person->last_name;
			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/person.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		} else {
			die('Invalid person ID');
		}
    }

	public function family() {
		$family = Person::getFamily();

		$pageTitle = 'Family';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/family.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function add() {
		$pageTitle = 'Add Person';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/addPerson.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addProcess($id) {
		// get POST variables
		$firstName 	 = $_POST['first']; // required
		$middleName = $_POST['middle'];
		$lastName 	 = $_POST['last']; // required
		$birth = $_POST['dob'];
		$death = $_POST['dod'];
		$married = $_POST['dom'];
		$mf = $_POST['gender'];

		// first name and last name are required
		if( empty($firstName) || empty($lastName) ) {
			header('Location: '.BASE_URL.'/family/add/'); exit();
		}
		$fileName = $firstName."-".$lastName."-".basename($_FILES["image"]["name"]);
		$target_file = "../../public/img/".$fileName;
		$imgType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
		if(isset($_POST["submit"])) {
			$check = getimagesize($_FILES["image"]["tmp_name"]);
			if($check !== false) {
				echo "File is an image - " . $check["mime"] . ".";
			} else {
				echo "File is not an image.";
				$fileName = '';
			}
			if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
				echo "The file ". basename( $_FILES["image"]["name"]). " has been uploaded.";
			} else {
				echo "Sorry, there was an error uploading your file.";
				$fileName = '';
			}
		} else {
			$fileName = '';
		}

		$person = new Person();
		$person->id = $id;
		$person->first_name = $firstName;
		$person->last_name = $lastName;
		$person->middle_name = $middleName;
		$person->picture_file = $fileName;
		$person->creator_id = 1; // hard coded user ID for now
		$person->birthday    = $birth;
        $person->deathday    =  $death;
		$person->married    = $married;
		$person->date_created = '';
		$person->gender = $mf;

		$personID = $person->save();
		header('Location: '.BASE_URL.'/family/view/'.$personID); exit();
	}

	public function addLifeEventProcess($soldierID) {
		$year = $_POST['year'];
		$title = $_POST['title'];
		$details = $_POST['details'];

		$le = new LifeEvent();
		$le->soldier_id = $soldierID;
		$le->year = $year;
		$le->title = $title;
		$le->details = $details;
		$le->save();

		if($le->id != 0) {
			$json = array(
				'success' => 'success',
				'life_event_id' => $le->id
			);
		} else {
			$json = array('error' => 'Could not save life event.');
		}

		header('Content-Type: application/json'); // let client know it's Ajax
		echo json_encode($json); // print the JSON

	}

	public function displayEdit($id) {
			$person = Person::loadById($id);
			if($person != null) {
				//$lifeEvents = LifeEvent::getBySoldierId($id);
				$pageTitle = $person->last_name;
				include_once SYSTEM_PATH.'/view/header.tpl';
				include_once SYSTEM_PATH.'/view/editPerson.tpl';
				include_once SYSTEM_PATH.'/view/footer.tpl';
			} else {
				die('Invalid person ID');
			}
	}
}
