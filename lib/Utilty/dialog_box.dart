  import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:statelessandstatefull/Utilty/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

    DialogBox({super.key,
     required this.controller, required this.onSave, required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.deepOrange,
     content: Container(
       height: 150,
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           // here make user input
           TextField(
             controller: controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: "Add New task",
             ),
           ),

           // here make two button Save and Cancel button
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               // Save Button
               MyButton(text: "Save",  onPressed: onSave),
               //ElevatedButton(onPressed: (){}, child: Text("Save!")),
               SizedBox(width: 10,),

               // Cancel Button
               MyButton(text: "Cancel", onPressed: onCancel)
             ],
           )

         ],
       ),
),
    );
  }
}
