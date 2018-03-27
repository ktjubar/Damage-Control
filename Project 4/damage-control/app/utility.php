<?php

class Utility {
  public static function get_month_string($month_num) {
    switch($month_num) {
      case 1:
        return "Jan.";
      case 2:
        return "Feb.";
      case 3:
        return "Mar.";
      case 4:
        return "Apr.";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "Aug.";
      case 9:
        return "Sept.";
      case 10:
        return "Oct.";
      case 11:
        return "Nov.";
      case 12:
        return "Dec.";
      default:
        return NULL;
    }
  }
}
