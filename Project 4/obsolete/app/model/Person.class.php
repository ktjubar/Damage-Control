<?php

class Person {
  const DB_TABLE = 'Crew'; // database table name

  // database fields for this table
  public $ID = 0;
  public $First_Name = '';
  public $Last_Name = '';
  public $Rank = 0;
  public $Date_of_Birth = '';
  public $Date_of_Death = '';
  public $Creater_Id = 0;
  public $Crew = '';

  // return a Person object by ID
  public static function loadById($ID) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE ID = %d;",
        self::DB_TABLE,
        $ID
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $person = new Person(); // instantiate new Soldier object

        // store db results in local object
        $person->ID          = $row['ID'];
        $person->First_Name   = $row['First_Name'];
        $person->Last_Name    = $row['Last_Name'];
        $person->Rank   = $row['Rank'];
        $person->Creator_Id   = $row['Creator_Id'];
        $person->Date_of_Birth    = $row['Date_of_Birth'];
        $person->Date_of_Death    = $row['Date_of_Death'];
        $person->Crew    = $row['Crew'];

        return $person; // return the person
      }
  }

  // return family as an array
  public static function getCrew() {
    $db = Db::instance();
    $q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY last ASC;";
    $result = $db->query($q);

    $Crew = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $Crew[] = self::loadById($row['ID']);
      }
    }
    return $Crew;
  }

  public function save(){
    if($this->ID == 0) {
      return $this->insert(); // soldier is new and needs to be created
    } else {
      return $this->update(); // soldier already exists and needs to be updated
    }
  }

  public function insert() {
    if($this->ID != 0)
      return null; // can't insert something that already has an ID

    $db = Db::instance(); // connect to db
    // build query

    // format dates for insertion
    if($this->Date_of_Birth != '')
      $this->Date_of_Birth = $db->formatDate($this->Date_of_Birth);
    if($this->Date_of_Death != '')
      $this->Date_of_Death = $db->formatDate($this->Date_of_Death);

    $q = sprintf("INSERT INTO `%s`(`First_Name`, `Last_Name`, `Creator_Id`, `Rank`, `Date_of_Birth`, `Date_of_Death`, `Crew`)
      VALUES (%s, %s, %d, %s, %s, %s, %s);",
      self::DB_TABLE,
      $db->escape($this->First_Name),
      $db->escape($this->Last_Name),
      $db->escape($this->Creator_Id),
      $db->escape($this->Rank),
      $db->escape($this->Date_of_Birth),
      $db->escape($this->Date_of_Death),
      $db->escape($this->Crew),
      );
      echo $q;
    $db->query($q); // execute query
    $this->ID = $db->getInsertID(); // set the ID for the new object
    return $this->ID;
  }

  public function update() {
    if($this->ID == 0)
      return null; // can't update something without an ID

      $db = Db::instance(); // connect to db
      // build query

      // format dates for insertion
      if($this->Date_of_Birth != '')
        $this->Date_of_Birth = $db->formatDate($this->Date_of_Birth);
      if($this->Date_of_Death != '')
        $this->Date_of_Death = $db->formatDate($this->Date_of_Death);

    // build query
      $q = sprintf("UPDATE `%s` SET
      `First_Name` = %s,
      `Last_Name` = %s,
      `Creator_Id` = %d,
      `Rank` = %s,
      `Date_of_Birth` = %s,
      `Date_of_Death` = %s,
      `Crew` = %s,
      WHERE `ID` = %d;",
      self::DB_TABLE,
      $db->escape($this->First_Name),
      $db->escape($this->Last_Name),
      $db->escape($this->Creator_Id),
      $db->escape($this->Rank),
      $db->escape($this->Date_of_Birth),
      $db->escape($this->Date_of_Death),
      $db->escape($this->Crew),
      $db->escape($this->ID)
      );

    $db->query($q); // execute query
    return $this->ID; // return this object's ID
  }

}
