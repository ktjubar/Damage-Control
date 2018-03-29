<?php

class LifeEvent
{
    const DB_TABLE = 'life_event'; // database table name

    // database fields for this table
    public $id = 0;
    public $year = 0;
    public $title = '';
    public $details = null;
    public $date_created = 0;
    public $soldier_id = 0;

    // return a Life Event object by ID
    public static function loadById($id)
    {
        $db = Db::instance(); // create db connection
        // build query
        $q = sprintf("SELECT * FROM `%s` WHERE id = %d;",
            self::DB_TABLE,
            $id
        );
        $result = $db->query($q); // execute query
        // make sure we found something
        if ($result->num_rows == 0) {
            return null;
        } else {
            $row = $result->fetch_assoc(); // get results as associative array

            $le = new LifeEvent(); // instantiate new Life Event object

            // store db results in local object
            $le->id = $row['id'];
            $le->year = $row['year'];
            $le->title = $row['title'];
            $le->details = $row['details'];
            $le->date_created = $row['date_created'];
            $le->soldier_id = $row['soldier_id'];

            return $le; // return the life event
        }
    }

    // return all life events attached to a soldier
    public static function getBySoldierId($soldierID)
    {
        $db = Db::instance();
        $q = sprintf("SELECT le.id AS LifeEventID FROM `%s` le
      INNER JOIN `%s` s ON
      le.soldier_id = s.id
      WHERE le.soldier_id = %d
      ORDER BY le.year ASC ",
            self::DB_TABLE,
            Soldier::DB_TABLE,
            $soldierID
        );
        //echo $q;
        $result = $db->query($q);

        $events = array();
        if ($result->num_rows != 0) {
            while ($row = $result->fetch_assoc()) {
                $events[] = self::loadById($row['LifeEventID']);
            }
        }
        return $events;
    }

    public function save()
    {
        if ($this->id == 0) {
            return $this->insert(); // object is new and needs to be created
        } else {
            return $this->update(); // object already exists and needs to be updated
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
        $q = sprintf("INSERT INTO `%s` (`year`, `title`, `details`, `soldier_id`)
    VALUES (%d, %s, %s, %d);",
            self::DB_TABLE,
            $db->escape($this->year),
            $db->escape($this->title),
            $db->escape($this->details),
            $db->escape($this->soldier_id)
        );
        //echo $q;
        $db->query($q); // execute query
        $this->id = $db->getInsertID(); // set the ID for the new object
        return $this->id;
    }

    public function update()
    {

    }

}
