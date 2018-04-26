<?php

class Feed {
  const DB_TABLE = 'Feed_Activity'; // database table name

  // database fields for this table
  public $id = 0;
  public $type = '';
  public $creator_id = 0;
  public $user_name = '';
  public $soldier_id = 0;
  public $crew_id = 0;
  public $delete_name = '';
  public $date_created = 0;

  // return object by ID
  public static function loadById($id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE ID = %d;",
        self::DB_TABLE,
        $id
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $fa = new Feed(); // instantiate new object

        // store db results in local object
        $fa->id           = $row['ID'];
        $fa->type         = $row['Type'];
        $fa->creator_id   = $row['Creator_ID'];
        $fa->user_name    = $row['User_Name'];
        $fa->soldier_id   = $row['Soldier_ID'];
        $fa->crew_id      = $row['Crew_ID'];
        $fa->delete_name  = $row['Delete_Name'];
        $fa->date_created = $row['Date_Created'];

        return $fa; // return the object
      }
  }

  public static function getFeedEvents($limit = null, $id = null) {
    $db = Db::instance(); // create db connection
    $q = sprintf("SELECT * FROM `%s`", self::DB_TABLE);
    
    if ($id != null) { // If id, get feeds created by $id
      $q .= sprintf(" WHERE `Creator_ID` = %d", $db->escape($id));
    } else if (isset($_SESSION['user_id'])) { // If login, get feeds created by $id and following
      $q .= sprintf(" WHERE `Creator_ID` = %d", $db->escape($_SESSION['user_id']));
      $following = User::getFollowing($id);
      foreach ($following as $f) {
        $q .= sprintf(" OR `Creator_ID` = %d", $db->escape($f->id));
      }
    }

    if ($id == null && $limit == null && !isset($_SESSION['user_id'])) {
      $q .= " LIMIT 15";
    } else if ($limit != null) {
      $q .= sprintf(" LIMIT %d", $db->escape($limit));
    }
    
    $result = $db->query($q);
    $feeds = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $feeds[] = self::loadById($row['ID']);
      }
    }
    return $feeds;
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

    $q = sprintf("INSERT INTO `%s` (
        `Type`,
        `Creator_ID`,
        `User_Name`,
        `Soldier_ID`,
        'Crew_ID',
        'Delete_Name',
        `Date_Created`
      ) VALUES (%s, %d, %s, %s, %s, %s);",
      self::DB_TABLE,
      $db->escape($this->type),
      $db->escape($this->creator_id),
      $db->escape($this->user_name),
      $db->escape($this->soldier_id),
      $db->escape($this->crew_id),
      $db->escape($this->delete_name),
      $db->escape($this->date_created)
      );
    //echo $q;
    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    return $this->id;
  }

  public function update() {}

}
