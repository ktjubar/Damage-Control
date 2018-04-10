<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new UserController();
$sc->route($action);

class UserController
{

    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'profile':
                if(isset($_GET['id']))
                    $this->viewPerson($_GET['id']);
                else
                    $this->viewPerson(0);
        }
    }

    public function viewPerson($id)
    {
        // get person's shit
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/user.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
