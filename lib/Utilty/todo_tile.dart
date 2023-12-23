import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {

  final String userName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   ToDoTile({super.key, required this.userName, required this.taskCompleted,
  required this.onChanged, required this.deleteFunction });

  @override
  Widget build(BuildContext context ) {
    return Padding(
      padding:  const EdgeInsets.all(25.0),
      child:Slidable(
    // Specify a key if the Slidable is dismissible.
    // key: const ValueKey(0),
    // The start action pane is the one at the left or the top side.
    startActionPane: ActionPane(
    // A motion is a widget used to control how the pane animates.
    motion: const ScrollMotion(),

    // A pane can dismiss the Slidable.
    // dismissible: DismissiblePane(onDismissed: () {}),

    // All actions are defined in the children parameter.
    children:  [
    // A SlidableAction can have an icon and/or a label.
       SlidableAction(
              onPressed: deleteFunction,
    backgroundColor: Color(0xFFFE4A49),
    foregroundColor: Colors.white,
    icon: Icons.delete,
    label: 'Delete',
    ),
    // SlidableAction(
    // onPressed: deleteFunction,
    // backgroundColor: Color(0xFF21B7CA),
    // foregroundColor: Colors.white,
    // icon: Icons.share,
    // label: 'Share',
    // ),
    ],
    ),

        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black87,),
              // task one
               Text(userName, style: TextStyle(fontSize: 20, color: Colors.black87,
                   // if task is completed then ? line through but if: its not completed then None
                   decoration:taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
               ),
               ),
            ],
          ),
        ),
    )
    );
  }
}
// Slidable(
// endActionPane: ActionPane(
// motion: const StretchMotion(),
// children: [
// SlidableAction(onPressed: deleteFunction),
// const Icon(Icons.delete_forever, color: Colors.deepPurpleAccent,),
// ],
// ),