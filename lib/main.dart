import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:statelessandstatefull/pages/TodoApp.dart';
import 'package:statelessandstatefull/pages/home_page.dart';


// import 'package:statelessandstatefull/pages/counter.dart';

void main() async {
  runApp(const MyApp());
  // init the hive
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      //Counter(),
    );
  }
}


