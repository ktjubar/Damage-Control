<?php

class Utility {
  public static function numToRank($num) {
    switch($num) {
      case 1:
        return "2nd Lietenant";
      case 2:
        return "1st Lieutenant";
      case 3:
        return "Captain";
      case 4:
        return "Major";
      case 5:
        return "Lieutenant Colonel";
      case 6:
        return "Colonel";
      case 7:
        return "Brigadier General";
      case 8:
        return "Major General";
      case 9:
        return "Lieutenant General";
      case 10:
        return "General";
    }
  }
}
