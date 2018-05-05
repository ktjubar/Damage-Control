<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new ArticleController();
$sc->route($action);

class ArticleController
{
    const DB_ARTICLE_TABLE = 'Articles';
    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'browse':
                $this->articles();
                break;
        }
    }

    public function articles() {
        $articles = Article::getArticles();
        $pageTitle = 'Browse Articles';
        $pageHeading = 'Articles';
        $pageSubheading = '';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseArticles.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
