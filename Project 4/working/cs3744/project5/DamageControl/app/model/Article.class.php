<?php

class Article
{
    const DB_TABLE = 'Articles'; // database table name

    // database fields for this table
    public $id = 0;
    public $title = '';
    public $subtitle = '';
    public $body = '';
    public $relevant_date = '';
    public $creator_id = 0;
    public $creator_username = '';
    public $date_created = '';

    // return a Person object by ID
    public static function loadById($id)
    {
        $db = Db::instance(); // create db connection
        // build query
        $q = sprintf("SELECT * FROM `%s` WHERE ID = %d;",
            self::DB_TABLE,
            $id
        );
        $result = $db->query($q); // execute query
        // make sure we found something
        if ($result->num_rows == 0) {
            return null;
        } else {
            $row = $result->fetch_assoc(); // get results as associative array

            $article = new Article(); // instantiate new Article object

            // store db results in local object
            $article->id = $row['ID'];
            $article->title = $row['Title'];
            $article->subtitle = $row['Subtitle'];
            $article->body = $row['Body'];
            $article->relevant_date = $row['Relevant_Date'];
            $article->creator_id = $row['Creator_ID'];
            $article->date_created = $row['Date_Created'];

            $article->creator_username = User::loadById($article->creator_id)->username;

            return $article; // return the article
        }
    }

    // return articles as an array
    public static function getArticles()
    {
        $db = Db::instance();
        $q = "SELECT ID FROM `" . self::DB_TABLE . "` ORDER BY Date_Created DESC;";
        $result = $db->query($q);

        $articles = array();
        if ($result->num_rows != 0) {
            while ($row = $result->fetch_assoc()) {
                $articles[] = self::loadById($row['ID']);
            }
        }
        return $articles;
    }

    public function save() {
        if ($this->id == 0) {
            return $this->insert(); // article is new and needs to be created
        } else {
            return $this->update(); // article already exists and needs to be updated
        }
    }

    public function insert()
    {
        if ($this->id != 0) {
            return null;
        }
        // can't insert something that already has an ID

        $db = Db::instance(); // connect to db
        // build query

        // format dates for insertion
        if ($this->relevant_date != '') {
            $this->relevant_date = $db->formatDate($this->relevant_date);
        }

        $q = sprintf("INSERT INTO `%s`(`Title`, `Creator_ID`, `Subtitle`, `Body`, `Relevant_Date`)
            VALUES (%s, %d, %s, %s, %s);",
            self::DB_TABLE,
            $db->escape($this->title),
            $db->escape($this->creator_id),
            $db->escape($this->subtitle),
            $db->escape($this->body),
            $db->escape($this->relevant_date)
        );
        echo($q);

        $success = $db->query($q); // execute query
        $this->id = $db->getInsertID(); // set the ID for the new object
        return $this->id;
    }

    public function update()
    {
        if ($this->id == 0) {
            return null;
        }
        // can't update something without an ID

        $db = Db::instance(); // connect to db
        // build query

        // format dates for insertion
        if ($this->relevant_date != '') {
            $this->relevant_date = $db->formatDate($this->relevant_date);
        }

        // build query
        $q = sprintf("UPDATE `%s` SET
            `Title` = %s,
            `Creator_ID` = %d,
            `Subtitle` = %s,
            `Body` = %s,
            `Relevant_Date` = %s
            WHERE `ID` = %d;",
            self::DB_TABLE,
            $db->escape($this->title),
            $db->escape($this->creator_id),
            $db->escape($this->subtitle),
            $db->escape($this->body),
            $db->escape($this->relevant_date),
            $db->escape($this->id)
        );

        $db->query($q); // execute query

        //Register a feed event

        return $this->id; // return this object's ID
    }
}
