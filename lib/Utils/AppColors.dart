import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum StatusValue {done,todo,rejected}

class AppColors{

  static Color primaryColor = const Color(0xFF3F51B5);
  static Color backgroundColor = const Color.fromRGBO(240, 240, 240, 1.0);

}


class Utils {

  StatusValue settodoStatus(String value){
    switch(value)
    {
    case 'done':
      return  StatusValue.done;
    case 'todo':
      return StatusValue.todo;
    case 'rejected':
      return StatusValue.rejected;
      default :
        return StatusValue.todo;
    }
  }

String setStringtodoStatus(StatusValue value){
  switch(value)
  {
    case StatusValue.done :
      return 'Done';
    case StatusValue.todo :
      return 'Todo';
    case StatusValue.rejected :
      return 'Rejected';
  }
}


  String timeFormate(DateTime assignDate){
    // DateTime tempDate = new DateFormat("E MM-dd-yy hh:mm").parse(assignDate);
    return DateFormat("hh:mm a").format(assignDate);
  }

  DateTime todateFormate(String assignDate){
    DateTime tempDate = new DateFormat("E MM-dd-yy hh:mm").parse(assignDate);
    return tempDate;
  }

  Color setColortodoStatus(StatusValue value){
    switch(value)
    {
      case StatusValue.done :
        return Colors.green;
      case StatusValue.todo :
        return Colors.blueAccent;
      case StatusValue.rejected :
        return Colors.red;
      default :
        return Colors.blueAccent;
    }
  }


}