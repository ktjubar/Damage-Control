<?php

session_start();

set_include_path(dirname(__FILE__));

include_once 'config.php';

// this function automatically loads any classes in the specified folder
function __autoload($className) {
	require_once 'model/'.$className.'.class.php';
}