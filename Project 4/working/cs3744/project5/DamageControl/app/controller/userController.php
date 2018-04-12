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
            case 'loginProcess':
                $username = $_POST['username'];
                $password = $_POST['password'];
                $this->loginProcess($username, $password);
                break;

            case 'logoutProcess':
                $this->logoutProcess();
                break;

            case 'profile':
                if(isset($_GET['id']))
                    $this->viewPerson($_GET['id']);
                else
                    $this->viewPerson(0);
                break;

            case 'browse':
                $this->browse();
                break;
        }
    }

    public function loginProcess($un, $pw)
    {
        // check password against username
        $user = User::loadByUsername($un);
        if (password_verify($pw, $user->getHashedPass())) {
            // log in
            $_SESSION['username'] = $un;
            header('Location: ' . BASE_URL);exit();
        } else {
            // invalid password
            echo '<script language="javascript">';
            echo 'alert("Invalid password")';
            echo '</script>';
            // header('Location: ' . BASE_URL);exit();
        }
    }

    public function logoutProcess()
    {
        unset($_SESSION['username']); // not necessary, but just to be safe
        session_destroy();
        header('Location: ' . BASE_URL);exit(); // send us to home page
    }

    public function viewPerson($id)
    {
        // get person's shit
        // set pageTitle to the user's name
        $pageTitle = 'View Person';
        $category = 'users';

        $fes = Feed::getFeedEvents(0);

        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/user.tpl';
        // include_once SYSTEM_PATH . '/view/activity.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function browse()
    {
        // get all the users
        $pageTitle = 'Browse Users';
        $category = 'users';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseUsers.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
