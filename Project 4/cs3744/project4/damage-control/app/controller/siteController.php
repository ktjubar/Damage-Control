<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
				$this->home();
				break;

			case 'family':
				$this->family();
				break;

			case 'people':
				$this->people();
				break;

			case 'search':
				$this->search();
				break;

			case 'loginProcess':
				$username = $_POST['username'];
				$password = $_POST['password'];

				$this->loginProcess($username, $password);
				break;

			case 'logoutProcess':
				$this->logoutProcess();
				break;
		}
	}

  public function home() {
		$pageTitle = 'Home';
		$category = 'home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function family() {
		$pageTitle = 'Family';
		$category = 'family';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/family.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function people() {
		$pageTitle = 'People';
		$category = 'people';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/people.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function search() {
		$pageTitle = 'Search';
		$category = 'search';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/search.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function loginProcess($user, $pwd) {
		$static_user = 'me';
		$static_pw = 'mine';

		if ($user != $static_user)
			header('Location: ' . BASE_URL);
		elseif ($pwd != $static_pw)
			header('Location: ' . BASE_URL);
		else {
			$_SESSION['username'] = $user;
			header('Location: ' . BASE_URL);
		}
	}

	public function logoutProcess() {
		unset($_SESSION['username']);
		session_destroy();
		header('Location: ' . BASE_URL); exit();
	}
}
