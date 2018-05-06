<?php

include_once '../global.php';

$articles = Article::getArticles();

foreach($articles as $a) {
  echo ' ';
  echo $a->title . ' ';
  echo $a->date_created;
  echo ' ';
}
