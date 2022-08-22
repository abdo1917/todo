import 'package:flutter/material.dart';
import 'package:todo/database/My_database.dart';

import 'database/task.dart';

class TasksProvider extends ChangeNotifier{
  List<Task> tasks = [];
  var date = DateTime.now();
  TasksProvider(){
    retrieveTasks();
  }
  void retrieveTasks([DateTime? newDateTime= null])async{
    if(newDateTime!=null)
      date = newDateTime;
    var tasksQuerySnapshot =await MyDatabase.getTasks(date);
    tasks = tasksQuerySnapshot.docs.map((e) => e.data()).toList();
    notifyListeners();
  }

}