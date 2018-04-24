<?php

class Crew
{
    const DB_TABLE = 'Crews'; // database table name

    // database fields for this table
    public $crewID = 0;
    public $name = '';
    public $nick = '';
    public $soldiers = array();
    public $remove = array();
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
            $crew->crewID = $row['ID'];
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
        $db = Db::instance();
        if ($this->date_created != '') {
            $this->date_created = date("Y-m-d", time());
        }

        $q = sprintf("INSERT INTO `%s`(`ID`, `Name`, `Creator_ID`)
        VALUES (%d, %s, %d) ON DUPLICATE KEY UPDATE `Name` = %s, `Creator_ID` = %d;",
        self::DB_TABLE,
        $db->escape($this->crewID),
        $db->escape($this->name),
        $db->escape($this->creator_id),
        $db->escape($this->name),
        $db->escape($this->creator_id)
        );
        $db->query($q);
        echo($q);
        //Parse soldiers
        if (!empty($this->soldiers)){
            foreach($this->soldiers as $s) {
                $q = sprintf("UPDATE `%s` SET `Crew_ID = %d WHERE `Crew_ID` = %d;",
                Soldier::DB_TABLE,
                $db->escape($this->crewID),
                $db->escape($s->ID));
                $db->query($q);
            }
        }

        if (!empty($this->remove)){
            foreach($this->remove as $s) {
                $q = sprintf("UPDATE `%s` SET `Crew_ID = %d WHERE `Crew_ID` = %d;",
                Soldier::DB_TABLE,
                0,
                $db->escape($s->ID));
                $db->query($q);
            }
        }
    }
}
