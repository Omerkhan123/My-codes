import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:statelessandstatefull/Utilty/dialog_box.dart';
import 'package:statelessandstatefull/Utilty/todo_tile.dart';
import 'package:statelessandstatefull/data/database.dart';
class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List toDoList = [
  //   ["Hi Omer", false],
  //   ["make app", false],
  // ];
  // we need   the reference the hive box
  final _myBox = Hive.openBox('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){

    // if the user is new so show default data

    if( _myBox.get ("TODOLIST") == null){
      db.createDataBase();
    } else{
      db.loadData();
    }

    super.initState();
  }




 // now we make text controller here
  final _controller = TextEditingController();
  // now make function when checkbox was tapped
   void checkBoxChanged  ( bool ? value,  int index )
   {
     setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
     });
     db.updateDatabase();
   }

   // create new methods for save button below
  void saveNewTask(){
     setState(() {
       db.toDoList.add([_controller.text, false]);
       _controller.clear();
     });
     Navigator.of(context).pop();
     db.updateDatabase();
  }
   // now we methods for create new task here
  void newTask(){
     showDialog(context: context, builder: (context){
       return DialogBox(
        controller: _controller,
         onSave: saveNewTask,
         onCancel:() => Navigator.of(context).pop(),
       );
     });
  }
  // function for delete the task
  void deleteTask (int index){
           setState(() {
   db.toDoList.removeAt(index);
                });
           db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TO DO")),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
          itemBuilder: (context, index){
          return ToDoTile(userName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged (value , index),
            deleteFunction: (context) => deleteTask(index));

          })
      //ListView(
        // children:  [
        //   ToDoTile(
        //     userName: "Hi Omer",
        //     taskCompleted: true,
        //     onChanged: (p0){},
        //   ),
        //   ToDoTile(
        //     userName: "make it nice App",
        //     taskCompleted: false,
        //     onChanged: (p0){},
        //   ),


    );
  }
}
