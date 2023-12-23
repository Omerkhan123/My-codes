import 'package:hive/hive.dart';


class ToDoDataBase {
  List toDoList = [];
  // ref the our hive box here
  final _myBox = Hive.box('myBox');
  // now we create the method that some one come first time ever
 void createDataBase(){
    toDoList = [
      ["Hi Omer", false],
     ["make app", false],
    ];
 }
  // now load  data from database
 void loadData (){
   toDoList = _myBox.get("TODOLIST");

 }
 // update the database
 void updateDatabase(){
   _myBox.put("TODOLIST", toDoList);

 }
}