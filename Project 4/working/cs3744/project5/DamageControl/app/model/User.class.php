<?php

class User {
  const DB_TABLE = 'Users'; // database table name

  const roles = array(
      'new' => 0,
      'admin' => 1,
      'superadmin' => 2
  );

  const genders = array(
      'male' => 0,
      'female' => 1,
      'other' => 2
  );

  // database fields for this table
  public $id = 0;
  public $username = '';
  public $firstname = '';
  public $lastname = '';
  public $middlename = '';
  public $gender = 0;
  public $email = '';
  public $role = 0;

  // return a User object by ID
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

          $user = new User(); // instantiate new User object

          // store db results in local object
          $user->id           = $row['ID'];
          $user->username     = $row['User'];
          $user->firstname    = $row['First_Name'];
          $user->lastname     = $row['Last_Name'];
          $user->middlename   = $row['Middle_Name'];
          $user->password     = $row['Pass'];
          $user->email        = $row['Email'];
          $user->role         = $row['Auth_Level'];

          return $user; // return the user
      }
  }

  public static function loadByUsername($username) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE User = '%s';",
              self::DB_TABLE,
              $username
          );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $user = new User(); // instantiate new User object

        // store db results in local object
        $user->id           = $row['ID'];
        $user->username     = $row['User'];
        $user->firstname    = $row['First_Name'];
        $user->lastname     = $row['Last_Name'];
        $user->middlename   = $row['Middle_Name'];
        $user->password     = $row['Pass'];
        $user->email        = $row['Email'];
        $user->role         = $row['Auth_Level'];

        return $user; // return the user
      }
  }

  /**
   *  Gets the hashed password for this user from the database
   */
  public function getHashedPass() {
      $db = Db::instance();
      $q = sprintf("SELECT Pass FROM `%s` WHERE User = '%s';",
              self::DB_TABLE,
              $this->username
          );

      $result = $db->query($q);   // don't have to check if it returned because we know it did since this is an object method
      $row = $result->fetch_assoc();
      return $row['Pass'];
  }

  public function save(){
    if($this->id == 0) {
      return $this->insert(); // user is new and needs to be created
    } else {
      return $this->update(); // user already exists and needs to be updated
    }
  }

  public function insert() {
    if($this->id != 0)
      return null; // can't insert something that already has an ID

    $db = Db::instance(); // connect to db
    // build query

    $q = sprintf("INSERT INTO `%s` (`id`, `username`, `password`, `email`, `role`)
    VALUES (%s, %s, %s, %s, %d);",
      self::DB_TABLE,
      $db->escape($this->id),
      $db->escape($this->username),
      $db->escape($this->password),
      $db->escape($this->email),
      $db->escape($this->role)
      );
    //echo $q;
    $db->query($q); // execute query
    $this->id = $db->getInsertID(); // set the ID for the new object
    return $this->id;
  }

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("UPDATE `%s` SET
      `id`        = %s,
      `username`  = %s,
      `password`  = %s,
      `email`     = %s,
      `role`      = %d
      WHERE `id` = %d;",
      self::DB_TABLE,
      $db->escape($this->id),
      $db->escape($this->username),
      $db->escape($this->password),
      $db->escape($this->email),
      $db->escape($this->role)
      );
    $db->query($q); // execute query
    return $db->id; // return this object's ID

  }

}
