import 'package:flutter/material.dart';
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // variable
  int _counter = 0;

  //methods or function
  void incCounter(){
    setState(() {
      _counter++;
    });
  }
  // UI (User Interface )
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Push the counter button ...."),
            Text(_counter.toString(),style: TextStyle(fontSize: 40),),
            ElevatedButton(onPressed: incCounter,
                child: Text("Increment!"),
            // its also work if you want to make onpressed like below
            //         (){
            //   incCounter();
            // },
              )
          ],
        ),
      ),
    );
  }
}
