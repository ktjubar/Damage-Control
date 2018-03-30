<?php

class Crew
{
    const DB_TABLE = 'Crews'; // database table name

    // database fields for this table
    public $crewID = 0;
    public $name = '';
    public $nick = '';
    public $soldiers = array();
    public $date_created = '';
    public $creator_id = 0;

    // return a Person object by ID
    public static function loadById($id)
    {
        $db = Db::instance(); // create db connection
        // build query
        $q = sprintf("SELECT * FROM `%s` WHERE Crew_ID = %d;",
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
            $crew->crewID = $row['Crew_ID'];
            $crew->name = $row['Name'];
            $crew->nick = $row['Nickname'];
            $crew->date_created = $row['Date_Created'];
            $crew->creator_id = $row['Creator_ID'];

            //Get the soldiers in this crew
            $q = sprintf("SELECT * FROM `%s` WHERE Crew_ID = %d;", Soldier::DB_TABLE, $id);
            $result = $db->query($q);
            $soldiers = array();
            if ($result->num_rows != 0) {
                while ($row = $result->fetch_assoc()) {
                    $soldiers[] = Soldier::loadById($row['ID']);
                }
            }
            $crew->soldiers = $soldiers;

            return $crew; // return the crew
        }
    }

    // return soldiers as an array
    public static function getCrews()
    {
        $db = Db::instance();
        $q = "SELECT Crew_ID FROM `" . self::DB_TABLE . "` ORDER BY Crew_ID ASC;";
        $result = $db->query($q);

        $crews = array();
        if ($result->num_rows != 0) {
            while ($row = $result->fetch_assoc()) {
                $crews[] = self::loadById($row['Crew_ID']);
            }
        }
        return $crews;
    }

    public function save()
    {
        if ($this->date_created != '') {
            $this->date_created = date("Y-m-d", time());
        }

        $q = sprintf("INSERT INTO `%s`(`Crew_ID`, `Name`, `Nickname`, `Creator_ID`, `Date_Created`)
        VALUES (%d, %s, %s, %d, %s) ON CONFLICT (`Crew_ID`) DO UPDATE;",
        self::DB_TABLE,
        $db->escape($this->crewID),
        $db->escape($this->name),
        $db->escape($this->nick),
        $db->escape($this->creator_id),
        $db->escape($this->date_created),
        );
    }
}
