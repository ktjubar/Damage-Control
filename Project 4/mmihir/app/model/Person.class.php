<?php

class Person {
  const DB_TABLE = 'family'; // database table name

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
  public $married = '';
  public $gender = '';

  // return a Person object by ID
  public static function loadById($id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE id = %d;",
        self::DB_TABLE,
        $id
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $person = new Person(); // instantiate new Soldier object

        // store db results in local object
        $person->id           = $row['id'];
        $person->first_name   = $row['first'];
        $person->middle_name   = $row['middle'];
        $person->last_name    = $row['last'];
        $person->picture_file    = $row['picture'];
        $person->date_created = $row['date'];
        $person->creator_id   = $row['creator_id'];
        $person->birthday    = $row['birth'];
        $person->deathday    = $row['death'];
        $person->married    = $row['married'];
        $person->gender = $row['gender'];

        return $person; // return the person
      }
  }

  // return family as an array
  public static function getFamily() {
    $db = Db::instance();
    $q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY last ASC;";
    $result = $db->query($q);

    $family = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $family[] = self::loadById($row['id']);
      }
    }
    return $family;
  }

  public function save(){
    if($this->id == 0) {
      return $this->insert(); // soldier is new and needs to be created
    } else {
      return $this->update(); // soldier already exists and needs to be updated
    }
  }

  public function insert() {
    if($this->id != 0)
      return null; // can't insert something that already has an ID

    $db = Db::instance(); // connect to db
    // build query

    // format dates for insertion
    if($this->date_created != '')
      $this->date_created = $db->formatDate($this->date_created);
    if($this->birthday != '')
      $this->birthday = $db->formatDate($this->birthday);
    if($this->deathday != '')
      $this->deathday = $db->formatDate($this->deathday);
    if($this->married != '')
      $this->married = $db->formatDate($this->married);

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

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

      $db = Db::instance(); // connect to db
      // build query
  
      // format dates for insertion
      if($this->date_created != '')
        $this->date_created = $db->formatDate($this->date_created);
      if($this->birthday != '')
        $this->birthday = $db->formatDate($this->birthday);
      if($this->deathday != '')
        $this->deathday = $db->formatDate($this->deathday);
      if($this->married != '')
        $this->married = $db->formatDate($this->married);

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
