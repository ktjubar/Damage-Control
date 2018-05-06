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

            case 'news':
                $q = "8th air force";
                if (isset($_GET['query'])) {
                    $q = $q." ".$_GET['query'];
                }
                $this->getNews($q);
                break;

            case 'loginerr':
                $this->home(1);
                break;

            case 'err404':
                $this->notFound();
                break;
        }
    }

    public function home($id = 0)
    {
        $pageTitle = 'Home';
        $fes = Feed::getFeedEvents(10);
        $articles = Article::getArticles();
        $pageHeading = 'The Mighty Eighth';
        $pageSubheading = 'Bomber Crews of the 8th Air Force';
        $imgURL = 'misc/8thplane.jpg';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/home.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
        if ($id == 1) {
            echo '<script language="javascript">';
            echo 'alert("Invalid credentials or user does not exist!");';
            echo '</script>';
        }
    }

    public function notFound() {
        $pageTitle = '404';
        $pageHeading = 'Oops!';
        $pageSubheading = 'Something went wrong, page not found.';
        $imgURL = 'misc/8thplane.jpg';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
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
        $pageHeading = 'News';
        $pageSubheading = '';
        $imgURL = 'misc/8thplane.jpg';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/news.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
