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

            case 'registerErr':
                $this->register(1);
                break;

            case 'registerProcess':
                $username = $_POST['username'];
                $password = $_POST['password'];
                $id = 0;
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                }
                $this->registerProcess($username, $password, $id);
                break;

            case 'friend':
                $user = $_SESSION['user_id'];
                $friend = $_GET['id'];
                $this->friend($user, $friend, 1);
                break;

            case 'unfriend':
                $user = $_SESSION['user_id'];
                $friend = $_GET['id'];
                $this->friend($user, $friend, 0);
                break;

            case 'view':
                $id = $_GET['id'];
                $this->view($id);
                break;

            case 'edit':
                $id = $_GET['id'];
                $this->edit($id);
                break;
        }
    }

    public function loginProcess($un, $pw)
    {
        // check password against username
        $user = User::loadByUsername($un);
        if ($user == null) {
            // invalid username
            header('Location: ' . BASE_URL . '/loginerr/');exit();
        } else if (password_verify($pw, $user->getHashedPass())) {
            // log in
            $_SESSION['username'] = $un;
            $_SESSION['user_id'] = $user->id;
            $_SESSION['role'] = $user->role;
            header('Location: ' . BASE_URL);exit();
        } else {
            // invalid password
            header('Location: ' . BASE_URL . '/loginerr/');exit();
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

    public function register($id = NULL)
    {
        $pageTitle = 'Register';
        $category = 'users';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/register.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
        if ($id == 1) {
            echo '<script language="javascript">';
            echo 'alert("Username is already taken!");';
            echo '</script>';
        }
    }

    public function registerProcess($un, $pw, $id)
    {
        //Check if username exists in database.
        $user = User::loadByUsername($un);
        if ($user != NULL && $id == 0) {
            // invalid username
            header('Location: ' . BASE_URL . '/users/register/err/');exit();
        }
        else if ($user == NULL && $id == 0) {//Create new user
            $user = new User();
            $user->username     = $un;
            $user->id           = $id;
            $user->firstname    = $_POST['firstname'];
            $user->lastname     = $_POST['lastname'];
            $user->middlename   = $_POST['middlename'];
            $user->password     = password_hash($pw, PASSWORD_DEFAULT);
            $user->email        = $_POST['email'];
            //$user->gender = $_POST['gender'];
            $id = $user->save();
            //$this->loginProcess($un, $pw);
            //header('Location: ' . BASE_URL . '/users/view/'.$id.'/');exit();
        }
        else {
            $user = User::loadById($id);
            $user->firstname    = $_POST['firstname'];
            $user->lastname     = $_POST['lastname'];
            $user->middlename   = $_POST['middlename'];
            //$user->gender = $_POST['gender'];
            $id = $user->save();
            header('Location: ' . BASE_URL . '/users/view/'.$id.'/');exit();
        }
    }

    //To use unfriend get user if from session and pass user id of other person as well.
    //redirects to here from <BASEURL>/users/friend/ and <BASEURL>/users/unfriend/
    //Requires $_POST variables user id1 and user id2
    public function friend($id1, $id2, $op)
    {
        $db = Db::instance();
        if($op == 1) { //Add friend
            $q = sprintf("INSERT INTO `%s` (`User1`, `User2`)
                VALUES (%d, %d);",
                self::DB_REL_TABLE,
                $db->escape($id1),
                $db->escape($id2)
            );
            $db->query($q); // execute query
            header('Location: ' . BASE_URL . '/users/view/' . $id2.'/');exit();
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
            $fes = Feed::getFeedEvents(10, $_SESSION['user_id']);
            $friends = User::getFriendUsers($_SESSION['user_id']);
            $friend = User::isFriend($_SESSION['user_id'], $id);
        } else {
            $fes = Feed::getFeedEvents(10);
        }
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/user.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function edit($id)
    {
        $user = User::loadById($id);
        $pageTitle = 'View '.$user->lastname;
        $category = 'users';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/edituser.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
