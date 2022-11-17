import 'package:hive_flutter/adapters.dart';

class ToDoDataBase {
  //for todolist to in homepage we use dp after using tododatabase and named it db
  List toDolist = [];
  //refrence the database
  final _mybox = Hive.box('mybox');

  //creating mehtod for user opeing the app for the first time
  void creationInitData() {
    toDolist = [
      ['Add Task Click  + Button', false],
      ['To Delete Slide Left', false],
    ];
  }

  void loadData() {
    toDolist = _mybox.get('TODOLIST');
  }

  void updateData() {
    _mybox.put('TODOLIST', toDolist);
  }
}
