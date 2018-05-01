<?php

$user = User::loadByUsername($_POST['username']);
if ($user != null) {
    echo "ok";
} else {
    echo "not";
}
