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
        if ($this->id == 0) {
            return $this->insert(); // crew is new and needs to be created
        } else {
            return $this->update(); // crew already exists and needs to be updated
        }
    }

    // TODO fix this
    public function insert()
    {
        return null;
    }

    // TODO fix this
    public function update()
    {
        return null; // return this object's ID
    }
}
