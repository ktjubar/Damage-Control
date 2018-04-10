<?php

class User {
  const DB_TABLE = 'user'; // database table name

  const roles = array(
    'admin' => 1,
    'superadmin' => 2
  );

  // database fields for this table
  public $id = 0;
  public $username = '';
  public $password = '';
  public $email = null;
  public $role = 0;

  // return a Soldier object by ID
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

        $user = new User(); // instantiate new Soldier object

        // store db results in local object
        $user->id         = $row['id'];
        $user->username   = $row['username'];
        $user->password   = $row['password'];
        $user->email      = $row['email'];
        $user->role       = $row['role'];

        return $user; // return the soldier
      }
  }

  public static function loadByUsername($username) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE username = '%s';",
        self::DB_TABLE,
        $username
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $user = new User(); // instantiate new Soldier object

        // store db results in local object
        $user->id         = $row['id'];
        $user->username   = $row['username'];
        $user->password   = $row['password'];
        $user->email      = $row['email'];
        $user->role       = $row['role'];

        return $user; // return the soldier
      }
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

    $q = sprintf("INSERT INTO `%s` (`id`, `username`, `password`, `email`, `role`)
    VALUES (%s, %s, %s, %s, %d);",
      self::DB_TABLE,
      $db->escape($this->id),
      $db->escape($this->username),
      $db->escape($this->password),
      $db->escape($this->email),
      $db->escape($this->role),
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
      $db->escape($this->role),
      );
    $db->query($q); // execute query
    return $db->id; // return this object's ID

  }

}
