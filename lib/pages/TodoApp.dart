// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// class ToDoApp extends StatefulWidget {
//   const ToDoApp({super.key});
//
//   @override
//   State<ToDoApp> createState() => _ToDoAppState();
// }
//
// class _ToDoAppState extends State<ToDoApp> {
//   // here we add variable to show name in App
//   String greetingMessage = "";
//
//   // here we need text-editor controller
//   TextEditingController myController = TextEditingController();
//
//   //methods/function
//   void tap(){
//     // print(myController.text);
//     String userName = myController.text;
//     setState(() {
//       // first trick
//       greetingMessage = "Hello," + userName;
//       // 2nd trick
//       // greetingMessage = "Hello," + myController.text;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       title: Text("ToDoApp"),
//     ),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(greetingMessage),
//                 // textField for input
//             TextField(
//                   controller: myController,
//               decoration: InputDecoration(
//                border: OutlineInputBorder(),
//                 hintText: "Enter your Name ..",
//
//               ),
//
//                 ),
//
//               // we make Button for it "Tap" is the function
//
//               ElevatedButton(
//                   onPressed: tap,
//                   child: Text("Tap")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
