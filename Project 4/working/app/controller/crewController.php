<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SoldierController and route it
$sc = new CrewController();
$sc->route($action);

class CrewController
{

    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'crews':
                $this->crews();
                break;

            case 'viewCrew':
                $id = $_GET['id'];
                $this->viewCrew($id);
                break;

            case 'addCrew':
                $this->addCrew();
                break;

            case 'addCrewProcess':
                $id = 0;
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                }
                $this->addCrewProcess($id);
                break;

            case 'editCrew':
                $id = $_GET['id'];
                $this->editCrew($id);
                break;
        }

    }

    public function crews()
    {
        $pageTitle = 'Browse Crews';
        $category = 'crews';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseCrews.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    // TODO update this to work with crew back-end
    public function viewCrew($id)
    {
        $person = Person::loadById($id);
        if ($person != null) {
            $pageTitle = $person->last_name;
            $category = 'crews';
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/crew.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            die('Invalid soldier ID');
        }
    }

    public function addCrew()
    {
        $pageTitle = 'Add Crew';
        $category = 'crews';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/addCrew.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    // TODO fix everything in here
    public function addCrewProcess($id)
    {
        // get POST variables
        $firstName = $_POST['first']; // required
        $middleName = $_POST['middle'];
        $lastName = $_POST['last']; // required
        $birth = $_POST['dob'];
        $death = $_POST['dod'];
        $married = $_POST['dom'];
        $mf = $_POST['gender'];

        // first name and last name are required
        if (empty($firstName) || empty($lastName)) {
            header('Location: ' . BASE_URL . '/family/add/');exit();
        }
        $fileName = $firstName . "-" . $lastName . "-" . basename($_FILES["image"]["name"]);
        $target_file = "../../public/img/" . $fileName;
        $imgType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (isset($_POST["submit"])) {
            $check = getimagesize($_FILES["image"]["tmp_name"]);
            if ($check !== false) {
                echo "File is an image - " . $check["mime"] . ".";
            } else {
                echo "File is not an image.";
                $fileName = '';
            }
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                echo "The file " . basename($_FILES["image"]["name"]) . " has been uploaded.";
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
        $person->birthday = $birth;
        $person->deathday = $death;
        $person->married = $married;
        $person->date_created = '';
        $person->gender = $mf;

        $personID = $person->save();
        header('Location: ' . BASE_URL . '/family/view/' . $personID);exit();
    }

    public function editCrew($id)
    {
        $person = Person::loadById($id);
        if ($person != null) {
            //$lifeEvents = LifeEvent::getBySoldierId($id);
            $pageTitle = $person->last_name;
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/editPerson.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            die('Invalid person ID');
        }
    }
}