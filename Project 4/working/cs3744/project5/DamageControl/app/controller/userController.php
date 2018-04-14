<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new UserController();
$sc->route($action);

class UserController
{
    const DB_REL_TABLE = 'User_Relations';
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

            case 'browse':
                $this->browse();
                break;

            case 'register':
                $this->register();
                break;

            case 'registerProcess':
                $username = $_POST['username'];
                $password = $_POST['password'];
                $this->registerProcess($username, $password);
                break;

            case 'friend':
                $user = $_POST['user'];
                $friend = $_POST['friend'];
                $this->friend($user, $friend, 1);
                break;

            case 'unfriend':
                $user = $_POST['user'];
                $friend = $_POST['friend'];
                $this->friend($user, $friend, 0);
                break;

            case 'view':
                $id = $_GET['id'];
                $this->view($id);
        }
    }

    public function loginProcess($un, $pw)
    {
        // check password against username
        $user = User::loadByUsername($un);
        if (password_verify($pw, $user->getHashedPass())) {
            // log in
            $_SESSION['username'] = $un;
            $_SESSION['user_id'] = $user->id;
            $_SESSION['role'] = $user->role;
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

    public function browse()
    {
        $users = User::getUsers();
        $pageTitle = 'Browse Users';
        $category = 'users';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseUsers.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function register()
    {
        $pageTitle = 'Register';
        $category = 'users';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/register.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function registerProcess($un, $pw)
    {
        //Check if username exists in database.
        $user = User::loadByUsername($un);
        if ($user == null) {//Create new user
            $user = new User();
            $user->username     = $un;
            $user->firstname    = $_POST['firstname'];
            $user->lastname     = $_POST['lastname'];
            $user->middlename   = $_POST['middlename'];
            $user->password     = $pw;
            $user->email        = $_POST['email'];
            $id = $user->save();
            header('Location: ' . BASE_URL . '/users/view/' . $id . '/');exit();
        } else {
            // invalid username
            echo '<script language="javascript">';
            echo 'alert("Username is already taken!")';
            echo '</script>';
            // header('Locat: ' . BASE_URL);exit();
        }
    }

    //To use unfriend get user if from session and pass user id of other person as well.
    //redirects to here from <BASEURL>/users/friend/ and <BASEURL>/users/unfriend/
    //Requires $_POST variables user id1 and user id2
    public function friend($id1, $id2, $op)
    {
        $db = Db::instance();
        if($op == 1) { //Add friend
            $q = sprintf("INSERT INTO `%s` (`User1`, `User2`, `Relationship`)
                VALUES (%d, %d, %d);",
                self::DB_REL_TABLE,
                $db->escape($id1),
                $db->escape($id2),
                $db->escape($op)
            );
            $db->query($q); // execute query
            header('Location: ' . BASE_URL . '/users/view/' . $id2);exit();
        } else if ($op == 0) { //remove friend
            $q = sprintf("DELETE FROM `%s` WHERE `User1` = %d AND `User2` = %d",
            self::DB_REL_TABLE,
            $db->escape($id1),
            $db->escape($id2)
            );
        $db->query($q); // execute query
        header('Location: ' . BASE_URL . '/users/view/');exit();
        }
    }

    public function view($id)
    {
        $user = User::loadById($id);
        $pageTitle = 'View '.$user->lastname;
        $category = 'users';
        if(isset($_SESSION['username'])) {
            $fes = Feed::getFeedEvents(10, $_SESSION['username']);
        } else {
            $fes = Feed::getFeedEvents(10);
        }
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/user.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
