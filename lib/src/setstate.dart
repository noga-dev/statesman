import 'package:flutter/material.dart';
import 'package:statesman/common.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Center(child: Text('Counter = $_counter')),
      floatingActionButton: MyFabs(
        incrementButton: () => setState(() => _counter++),
        decrementButton: () => setState(() => _counter--),
      ),
    );
  }
}
