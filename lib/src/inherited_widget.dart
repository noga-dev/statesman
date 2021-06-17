import 'package:flutter/material.dart';
import 'package:statesman/common.dart';

class CountInheritedWidget extends InheritedWidget {
  CountInheritedWidget({Key? key, required this.counter, Widget? child})
      : super(key: key, child: child!);

  final int counter;

  @override
  bool updateShouldNotify(CountInheritedWidget oldWidget) =>
      oldWidget.counter != counter;

  static CountInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountInheritedWidget>();
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Inherited Widget'),
      body: CountInheritedWidget(
        counter: counter,
        child: const Center(
          child: CounterText(),
        ),
      ),
      floatingActionButton: MyFabs(
        incrementButton: () => setState(() => counter++),
        decrementButton: () => setState(() => counter--),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText();
  @override
  Widget build(BuildContext context) {
    return Text(
        'Counter = ${CountInheritedWidget.of(context)?.counter ?? -111}');
  }
}
