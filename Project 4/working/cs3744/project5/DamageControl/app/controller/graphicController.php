<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new GraphicController();
$sc->route($action);

class GraphicController
{

    public $pageTitle = '';
    public $pageHeading = '';
    public $pageSubheading = '';
    public $imgURL = 'misc/8thplane.jpg';
    public $meta = false;
    
    // route us to the appropriate class method for this action
    public function route($action)
    {
        switch ($action) {
            case 'graphic':
                $this->graphic();
                break;
        }
    }

    public function graphic() {
        $pageTitle = 'Graphics';
        $pageHeading = 'Graphic';
        $pageSubheading = 'Nothing to see here...';
        include_once SYSTEM_PATH . '/view/header.tpl';
        include_once SYSTEM_PATH . '/view/graphic.tpl';
        include_once SYSTEM_PATH . '/view/footer.tpl';
    }
}
