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
            $pageTitle = $crew->name;
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
        // get POST variables
        $crewID = $_POST['crewID'];
        $name = $_POST['name'];
        $nick = $_POST['nickname'];
        $soldiers = $_POST['soldiers'];
        $remove = $_POST['remove'];

        // first name and last name are required
        if (empty($crewID) || empty($name)) {
            header('Location: ' . BASE_URL . '/crews/add/');exit();
        }

        $crew = new Crew();
        $crew->crewID = $crewID;
        $crew->name = $name;
        $crew->nick = $nick;
        $crew->soldiers = $soldiers;
        $crew->remove = $remove;

        $crewID = $crew->save();
        header('Location: ' . BASE_URL . '/crews/view/' . $crewID);exit();
    }

    public function editCrew($id)
    {
        $crew = Crew::loadById($id);
        if ($crew != null) {
            $pageTitle = 'Edit '.$crew->name;
            $category = 'crews';
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/editCrew.tpl';
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
            header('Location: ' . BASE_URL . '/crews');exit();
        }
    }
}
