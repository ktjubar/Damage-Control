<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController
{

    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'home':
                $this->home();
                break;

            case 'loginProcess':
                $username = $_POST['username'];
                $password = $_POST['password'];
                $this->loginProcess($username, $password);
                break;

            case 'logout':
                $this->logoutProcess();
                break;

            case 'news':
                $q = "8th air force";
                if (isset($_GET['query'])) {
                    $q = $q." ".$_GET['query'];
                }
                $this->getNews($q);
                break;

            // case 'about':
            //     $this->about();
            //     break;

            // case 'dashboard':
            //     $this->dashboard();
            //     break;
        }
    }

    public function home()
    {
        $pageTitle = 'Home';
        $category = 'home';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/home.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function loginProcess($un, $pw)
    {
        $correctUsername = 'admin';
        $correctPassword = 'admin';

        if ($un != $correctUsername) {
            header('Location: ' . BASE_URL);
        } elseif ($pw != $correctPassword) {
            header('Location: ' . BASE_URL);
        } else {
            $_SESSION['username'] = $un;
            header('Location: ' . BASE_URL);
        }
    }

    public function logoutProcess()
    {
        unset($_SESSION['username']); // not necessary, but just to be safe
        session_destroy();
        header('Location: ' . BASE_URL);exit(); // send us to home page
    }

    public function getNews($q) {
        $q = urlencode($q);
        $site = "https://chroniclingamerica.loc.gov/search/pages/results/?andtext=".$q."&format=json";
        $data = file_get_contents($site);
        $json = json_decode($data);
        $items = $json->{'items'};

        shuffle($items);
        $article = $items[0];
        $title = $article->title;

        $site = $article->url;
        $data = file_get_contents($site);
        $json = json_decode($data);
        $pdf = $json->{'pdf'};

        $pageTitle = 'News';
        $category = 'news';

        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/news.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    // public function about()
    // {
    //     $pageTitle = 'About';
    //     include_once SYSTEM_PATH . '/view/header.tpl';
    //     include_once SYSTEM_PATH . '/view/about.tpl';
    //     include_once SYSTEM_PATH . '/view/footer.tpl';
    // }

    // public function dashboard()
    // {
    //     // redirect if not logged in
    //     if (!isset($_SESSION['username'])) {
    //         header('Location: ' . BASE_URL);exit();
    //     }
    //
    //     $pageTitle = 'Dashboard';
    //     include_once SYSTEM_PATH . '/view/header.tpl';
    //     include_once SYSTEM_PATH . '/view/dashboard.tpl';
    //     include_once SYSTEM_PATH . '/view/footer.tpl';
    // }

    // public function login()
    // {
    //     $pageTitle = 'Login';
    //     include_once SYSTEM_PATH . '/view/header.tpl';
    //     include_once SYSTEM_PATH . '/view/login.tpl';
    //     include_once SYSTEM_PATH . '/view/footer.tpl';
    // }
}
