import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Scaffold(
        body: CountInheritedWidget(
          counter: counter,
          child: const Center(
            child: CounterText(),
          ),
        ),
        floatingActionButton: Wrap(
          children: [
            if (ModalRoute.of(context)?.canPop ?? false)
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: FloatingActionButton(
                  onPressed: null,
                  child: BackButton(),
                ),
              ),
            FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => setState(() => counter++),
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => setState(() => counter--),
              backgroundColor: Colors.deepOrange,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
}

class CounterText extends StatelessWidget {
  const CounterText();
  @override
  Widget build(BuildContext context) {
    return Text(
        'Inherited Widget = ${CountInheritedWidget.of(context)?.counter ?? -111}');
  }
}
