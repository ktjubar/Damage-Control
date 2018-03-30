<?php

class Crew
{
    const DB_TABLE = 'crews'; // database table name

    // database fields for this table
    public $id = 0;
    public $name = '';
    public $soldiers = array();
    public $date_created = '';
    public $creator_id = 0;

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

            $crew = new Crew(); // instantiate new Soldier object

            // store db results in local object
            $crew->id = $row['ID'];
            $crew->name = $row['Name'];
            $crew->date_created = $row['Date_Created'];
            $crew->creator_id = $row['Creator_ID'];

            $q = sprintf("SELECT * FROM `%s` WHERE Crew_ID = %d;", Soldier::DB_TABLE, $id);
            $result = $db->query($q);

            $soldiers = array();
            if ($result->num_rows != 0) {
                while ($row = $result->fetch_assoc()) {
                    $soldiers[] = Soldier::loadById($row['ID']);
                }
            }

            $crew->soldiers = $soldiers;

            return $crew; // return the person
        }
    }

    // return soldiers as an array
    public static function getCrews()
    {
        $db = Db::instance();
        $q = "SELECT ID FROM `" . self::DB_TABLE . "` ORDER BY ID ASC;";
        $result = $db->query($q);

        $crews = array();
        if ($result->num_rows != 0) {
            while ($row = $result->fetch_assoc()) {
                $crews[] = self::loadById($row['ID']);
            }
        }
        return $crews;
    }

    public function save()
    {
        if ($this->id == 0) {
            return $this->insert(); // soldier is new and needs to be created
        } else {
            return $this->update(); // soldier already exists and needs to be updated
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
        if ($this->date_created != '') {
            $this->date_created = $db->formatDate($this->date_created);
        }

        if ($this->birthday != '') {
            $this->birthday = $db->formatDate($this->birthday);
        }

        if ($this->deathday != '') {
            $this->deathday = $db->formatDate($this->deathday);
        }

        if ($this->married != '') {
            $this->married = $db->formatDate($this->married);
        }

        $q = sprintf("INSERT INTO `%s`(`first`, `middle`, `last`, `creator_id`, `picture`, `date`, `birth`, `death`, `married`, `gender`)
      VALUES (%s, %s, %s, %d, %s, %s, %s, %s, %s, %s);",
            self::DB_TABLE,
            $db->escape($this->first_name),
            $db->escape($this->middle_name),
            $db->escape($this->last_name),
            $db->escape($this->creator_id),
            $db->escape($this->picture_file),
            $db->escape($this->date_created),
            $db->escape($this->birthday),
            $db->escape($this->deathday),
            $db->escape($this->married),
            $db->escape($this->gender)
        );
        echo $q;
        $db->query($q); // execute query
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
        if ($this->date_created != '') {
            $this->date_created = $db->formatDate($this->date_created);
        }

        if ($this->birthday != '') {
            $this->birthday = $db->formatDate($this->birthday);
        }

        if ($this->deathday != '') {
            $this->deathday = $db->formatDate($this->deathday);
        }

        if ($this->married != '') {
            $this->married = $db->formatDate($this->married);
        }

        // build query
        $q = sprintf("UPDATE `%s` SET
      `first` = %s,
      `middle` = %s,
      `last` = %s,
      `creator_id` = %d,
      `date` = %s,
      `birth` = %s,
      `death` = %s,
      `married` = %s,
      `gender` = %s
      WHERE `id` = %d;",
            self::DB_TABLE,
            $db->escape($this->first_name),
            $db->escape($this->middle_name),
            $db->escape($this->last_name),
            $db->escape($this->creator_id),
            $db->escape($this->date_created),
            $db->escape($this->birthday),
            $db->escape($this->deathday),
            $db->escape($this->married),
            $db->escape($this->gender),
            $db->escape($this->id)
        );

        $db->query($q); // execute query
        return $this->id; // return this object's ID
    }

}
