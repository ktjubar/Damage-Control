<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$ac = new ArticleController();
$ac->route($action);

class ArticleController {
    const DB_ARTICLE_TABLE = 'Articles';

    // route us to the appropriate class method for this action
    public function route($action) {
        switch ($action) {
            case 'browse':
                $this->articles();
                break;

            case 'viewArticle':
                $id = $_GET['id'];
                $this->viewArticle($id);
                break;
        }
    }

    public function articles() {
        $articles = Article::getArticles();
        $pageTitle = 'Browse Articles';
        $pageHeading = 'Articles';
        $pageSubheading = '';
        $imgURL = 'misc/8thplane.jpg';
        $meta = false;
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/browseArticles.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function viewArticle($id) {
        $article = Article::loadById($id);
        if ($article != null) {
            $pageTitle = $article->title;
            $pageHeading = $article->title;
            $pageSubheading = $article->subtitle;
            $imgURL = 'misc/8thplane.jpg';
            $meta = true;
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/article.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid article ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
        }
    }
}
