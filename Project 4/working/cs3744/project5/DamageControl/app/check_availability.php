<?php

$user = User::loadByUsername($_POST['username']);
if ($user != null) {
    echo true;
} else {
    echo false;
}
