<?php

class User {
  const DB_TABLE = 'Users'; // database table name
  const DB_REL_TABLE = 'User_Relations';

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

    $q = sprintf("INSERT INTO `%s` (`User`, `Pass`, `First_Name`, `Last_Name`, `Middle_Name`, `Gender`, `Email`)
      VALUES (%s, %s, %s, %s, %s,  %d, %s);",
      self::DB_TABLE,
      $db->escape($this->username),
      $db->escape($this->password),
      $db->escape($this->firstname),
      $db->escape($this->lastname),
      $db->escape($this->middlename),
      $db->escape($this->gender),
      $db->escape($this->email)
      );
    //echo $q;
    $db->query($q); // execute query
    $id = $db->getInsertID(); // set the ID for the new object

    // Make person follow self
    $q = sprintf("INSERT INTO `%s` (`User1`, `User2`) VALUES (%d, %d);",
      self::DB_REL_TABLE,
      $db->escape($id),
      $db->escape($id)
    );
    $db->query($q); // execute query
    return $id;
  }

  public function update() {
    if($this->id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // build query
    $q = sprintf("UPDATE `%s` SET
      `First_Name` = %s,
      `Middle_Name` = %s,
      `Last_Name` = %s
      WHERE `ID` = %d;",
      self::DB_TABLE,
      $db->escape($this->firstname),
      $db->escape($this->middlename),
      $db->escape($this->lastname),
      $db->escape($this->id)
      );
    $db->query($q); // execute query
    return $this->id; // return this object's ID
  }

  public static function getUsers()
  {
      $db = Db::instance();
      $q = "SELECT ID FROM `" . self::DB_TABLE . "` ORDER BY Last_Name ASC;";
      $result = $db->query($q);

      $users = array();
      if ($result->num_rows != 0) {
          while ($row = $result->fetch_assoc()) {
              $users[] = self::loadById($row['ID']);
          }
      }
      return $users;
  }

  public static function getFriendUsers($id)
  {
    $db = Db::instance();
    $q = sprintf("SELECT `User1` AS `users` FROM %s WHERE `User2` = %d",
      self::DB_REL_TABLE,
      $db->escape($id)
    );
    $res1 = $db->query($q);
    $users1 = array();
    if ($res1->num_rows != 0) {
      while ($row = $res1->fetch_assoc()) {
          $users1[] = self::loadByUsername($row['users']);
      }
    }

    $q = sprintf("SELECT `User2` AS `users` FROM %s WHERE `User1` = %d",
      self::DB_REL_TABLE,
      $db->escape($id)
    );
    $res2 = $db->query($q);
    $users2 = array();
    if ($res2->num_rows != 0) {
      while ($row = $res2->fetch_assoc()) {
          $users2[] = self::loadByUsername($row['users']);
      }
    }

    $users = array_merge($users1, $users2);
    return $users;
  }

  public static function isFriend($id1, $id2)
  {
    $db = Db::instance();
    $q = sprintf("SELECT FROM %s WHERE (`User1` = %d AND `User2` = %d) OR (`User1` = %d AND `User2` = %d)",
      self::DB_REL_TABLE,
      $db->escape($id1),
      $db->escape($id2),
      $db->escape($id2),
      $db->escape($id1)
    );
    $res = $db->query($q);
    if ($res != NULL) {
      return true;
    }
    return false;
  }
}
