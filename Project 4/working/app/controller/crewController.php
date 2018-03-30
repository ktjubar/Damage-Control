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
        $crews = Crew::getCrews();
        $pageTitle = 'Browse Crews';
        $category = 'crews';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseCrews.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    // TODO update this to work with crew back-end
    public function viewCrew($id)
    {
        $crew = Crew::loadById($id);
        if ($crew != null) {
            $pageTitle = $crew->crewID;
            $category = 'crews';
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/crew.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid crew ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
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
        // get POST variablespublic $crewID = 0;
        $name = '';
        $nick = '';
        $soldiers = array();

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
        $crew = Crew::loadById($id);
        if ($crew != null) {
            $pageTitle = $crew->crewID;
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/editPerson.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid person ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
        }
    }

    public function deleteCrew($id) {
        if ($this->id != 0) {
            $q = sprintf("DELETE FROM `%s` WHERE ID = %d;", Crew::DB_TABLE, $db->escape($this->$id));
            $db->query($q); // execute query

            $q = sprintf("UPDATE `%s` SET `Crew_ID` = 0 WHERE `Crew_ID` = %d;",
            Soldier::DB_TABLE,
            $db->escape($this->$id));
            $db->query($q); // execute query
        }
    }
}
