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

            case 'addArticle':
                $this->addArticle();
                break;

            case 'addArticleProcess':
                $id = 0;
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                }
                $this->addArticleProcess($id);
                break;

            case 'editArticle':
                $id = $_GET['id'];
                $this->editArticle($id);
                break;

            case 'deleteArticle':
                if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                    $this->deleteArticle($id);
                }
                break;
        }
    }

    public function articles() {
        $articles = Article::getArticles();
        $pageTitle = 'Browse Articles';
        $pageHeading = 'Articles';
        $pageSubheading = '';
        $imgURL = 'misc/8thplane.jpg';
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
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/article.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid article ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
        }
    }

    public function addArticle() {
        $pageTitle = 'Add Article';
        $pageHeading = 'Add Article';
        $pageSubheading = '';
        $imgURL = 'misc/8thplane.jpg';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/addArticle.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }

    public function addArticleProcess($id) {
        // get POST variables
        $title = $_POST['title'];
        $subtitle = $_POST['subtitle'];
        $body = $_POST['body'];
        $relevant_date = $_POST['relevdate'];

        // first name and last name are required
        if (empty($firstName) || empty($lastName)) {
            header('Location: ' . BASE_URL . '/soldiers/add/');exit();
        }

        $a = new Article();
        $a->id = $id;
        $a->first_name = $firstName;
        $a->last_name = $lastName;
        $a->creator_id = $_SESSION['user_id'];
        $a->birthday = $birth;
        $a->deathday = $death;
        $a->date_created = '';
        $a->rank = $rank;
        $aID = $a->save();

        // $feed = new Feed();
        // $feed->creator_id = $_SESSION['user_id'];
        // $feed->soldier_id = $aID;
        // $feed->type = 'addSoldier';
        // if ($id !== 0)
        //     $feed->type = 'editSoldier';
        // $feed->save();

        header('Location: ' . BASE_URL . '/articles/view/' . $aID);exit();
    }

    public function editArticle($id) {
        $s = Soldier::loadById($id);
        if ($s != null) {
            //$lifeEvents = LifeEvent::getBySoldierId($id);
            $pageTitle = 'Edit '.$s->last_name;
            $pageHeading = 'Edit '.$s->first_name.' '.$s->last_name;
            $pageSubheading = '';
            $imgURL = 'misc/8thplane.jpg';
            include_once SYSTEM_PATH . '/view/header.tpl';
            include_once SYSTEM_PATH . '/view/editSoldier.tpl';
            include_once SYSTEM_PATH . '/view/footer.tpl';
        } else {
            include_once SYSTEM_PATH . '/view/header.tpl';
            die('Invalid soldier ID');
            include_once SYSTEM_PATH . '/view/footer.tpl';
        }
    }

    public function deleteArticle($id) {
        $s = Soldier::loadByID($id);
        if ($id != 0) {

            // $feed = new Feed();
            // $feed->creator_id = $_SESSION['user_id'];
            // $feed->delete_name = $s->first_name.' '.$s->last_name;
            // $feed->type = 'deleteSoldier';
            // $feed->save();

            $db = Db::instance(); // connect to db
            $q = sprintf("DELETE FROM `%s` WHERE ID = %d;", Soldier::DB_TABLE, $db->escape($id));
            $db->query($q); // execute query

            header('Location: ' . BASE_URL . '/soldiers');exit();
        }
    }
}
