<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SoldierController and route it
$sc = new SoldierController();
$sc->route($action);

class SoldierController
{

    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'soldiers':
                $this->soldiers();
                break;

            case 'viewSoldier':
                $id = $_GET['id'];
                $this->viewSoldier($id);
                break;

            case 'addSoldier':
                $this->addSoldier();
                break;

            case 'addSoldierProcess':
                $id = 0;
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                }
                $this->addSoldierProcess($id);
                break;

            case 'editSoldier':
                $id = $_GET['id'];
                $this->editSoldier($id);
                break;

            case 'deleteSoldier':
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                    $this->deleteSoldier($id);
                }
                break;
        }

    }

    public function soldiers()
    {
        $pageTitle = 'Browse Soldiers';
        $category = 'soldiers';
        $soldiers = Soldier::getSoldiers();
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseSoldiers.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    // TODO update this to work with soldier back-end
    public function viewSoldier($id)
    {
        $s = Soldier::loadById($id);
        if ($s != null) {
            $pageTitle = $s->last_name;
            $category = 'soldiers';
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/soldier.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid soldier ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
        }
    }

    public function addSoldier()
    {
        $pageTitle = 'Add Soldier';
        $category = 'soldiers';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/addSoldier.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    // TODO Fix everything in here
    public function addSoldierProcess($id)
    {
        // get POST variables
        $firstName = $_POST['first']; // required
        //$middleName = $_POST['middle'];
        $lastName = $_POST['last']; // required
        $birth = $_POST['dob'];
        $death = $_POST['dod'];
        $crew = $_POST['crew'];
        $rank = $_POST['rank'];

        // first name and last name are required
        if (empty($firstName) || empty($lastName)) {
            header('Location: ' . BASE_URL . '/soldiers/add/');exit();
        }

        $s = new Soldier();
        $s->id = $id;
        $s->first_name = $firstName;
        $s->last_name = $lastName;
        //$s->middle_name = $middleName;
        $s->creator_id = 1; // hard coded user ID for now
        $s->birthday = $birth;
        $s->deathday = $death;
        $s->date_created = '';
        $s->rank = $rank;

        $sID = $s->save();

        $feed = new Feed();
        $feed->creator_id = $_SESSION['user_id'];
        $feed->soldier_id = $id;
        $feed->type = 'addSoldier';
        $feed->save();

        //header('Location: ' . BASE_URL . '/soldiers/view/' . $sID);exit();
    }

    public function editSoldier($id)
    {
        $s = Soldier::loadById($id);
        if ($s != null) {
            //$lifeEvents = LifeEvent::getBySoldierId($id);
            $pageTitle = 'Edit '.$s->last_name;
            $category = 'soldiers';
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/editSoldier.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';

            $feed = new Feed();
            $feed->creator_id = $_SESSION['user_id'];
            $feed->soldier_id = $id;
            $feed->type = 'editSoldier';
            $feed->save();

        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid soldier ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
        }
    }

    public function deleteSoldier($id) {
        $s = Soldier::loadByID($id);
        if ($id != 0) {
            $feed = new Feed();
            $feed->creator_id = $_SESSION['user_id'];
            $feed->delete_name = $s->first_name.' '.$s->last_name;
            $feed->type = 'deleteSoldier';
            $feed->save();

            $db = Db::instance(); // connect to db
            $q = sprintf("DELETE FROM `%s` WHERE ID = %d;", Soldier::DB_TABLE, $db->escape($id));
            $db->query($q); // execute query

            header('Location: ' . BASE_URL . '/soldiers');exit();
        }
    }
}
