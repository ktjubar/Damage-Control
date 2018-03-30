<?php

class Soldier
{
    const DB_TABLE = 'Soldiers'; // database table name

    // database fields for this table
    public $id = 0;
    public $first_name = '';
    public $middle_name = '';
    public $last_name = '';
    public $picture_file = '';
    public $date_created = '';
    public $creator_id = 0;
    public $birthday = '';
    public $deathday = '';
    public $rank = '';
    public $crewID = '';

    // return a Person object by ID
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

            $soldier = new Soldier(); // instantiate new Soldier object

            // store db results in local object
            $soldier->id = $row['ID'];
            $soldier->first_name = $row['First_Name'];
            //$soldier->middle_name = $row['middle'];
            $soldier->last_name = $row['Last_Name'];
            //$soldier->picture_file = $row['picture'];
            $soldier->date_created = $row['Date_Created'];
            $soldier->creator_id = $row['Creator_ID'];
            $soldier->birthday = $row['Date_of_Birth'];
            $soldier->deathday = $row['Date_of_Birth'];
            $soldier->rank = $row['Rank'];
            $soldier->crewID = $row['Crew_ID'];

            return $soldier; // return the person
        }
    }

    // return soldiers as an array
    public static function getSoldiers()
    {
        $db = Db::instance();
        $q = "SELECT ID FROM `" . self::DB_TABLE . "` ORDER BY Last_Name ASC;";
        $result = $db->query($q);

        $soldiers = array();
        if ($result->num_rows != 0) {
            while ($row = $result->fetch_assoc()) {
                $soldiers[] = self::loadById($row['ID']);
            }
        }
        return $soldiers;
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
            $this->date_created = date("Y-m-d", time());
        }

        if ($this->birthday != '') {
            $this->birthday = $db->formatDate($this->birthday);
        }

        if ($this->deathday != '') {
            $this->deathday = $db->formatDate($this->deathday);
        }

        $q = sprintf("INSERT INTO `%s`(`First_Name`, `Last_Name`, `Rank`, `Date_of_Birth`, `Date_of_Death`, `Crew_ID`, `Creator_ID`, `Date_Created`)
      VALUES (%s, %s, %d, %s, %s, %d, %s, %s);",
            self::DB_TABLE,
            $db->escape($this->first_name),
            //$db->escape($this->middle_name),
            $db->escape($this->last_name),
            $db->escape($this->rank),
            $db->escape($this->birthday),
            $db->escape($this->deathday),
            $db->escape($this->crewID),
            $db->escape($this->creator_id),
            $db->escape($this->date_created)
        );

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

        // build query
        $q = sprintf("UPDATE `%s` SET
        `First_Name` = %s,
        `Last_Name` = %s,
        `Rank` = %d,
        `Date_of_Birth` = %s,
        `Date_of_Death` = %s,
        `Crew_ID` = %d,
        `Creator_ID` = %d,
        `Date_Created` = %s
        WHERE `ID` = %d;",
        self::DB_TABLE,
            $db->escape($this->first_name),
            $db->escape($this->last_name),
            $db->escape($this->rank),
            $db->escape($this->birthday),
            $db->escape($this->deathday),
            $db->escape($this->crewID),
            $db->escape($this->creator_id),
            $db->escape($this->date_created)
        );

        $db->query($q); // execute query
        return $this->id; // return this object's ID
    }

}
