import 'package:flutter/material.dart';
import 'package:statesman/common.dart';

class CountModel extends InheritedModel<String> {
  const CountModel({required this.count, child}) : super(child: child);

  final int count;

  @override
  bool updateShouldNotify(CountModel oldWidget) => oldWidget.count != count;

  @override
  bool updateShouldNotifyDependent(
          InheritedModel<String> oldWidget, Set<String> dependencies) =>
      dependencies.contains('counter');

  static CountModel? of(BuildContext context, String aspect) =>
      InheritedModel.inheritFrom<CountModel>(context, aspect: aspect);
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Inherited Model'),
      body: CountModel(
        count: count,
        child: const Center(
          child: CounterText(),
        ),
      ),
      floatingActionButton: MyFabs(
        incrementButton: () => setState(() => count++),
        decrementButton: () => setState(() => count--),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText();
  @override
  Widget build(BuildContext context) {
    var model = CountModel.of(context, 'counter');
    return Text('Count: ${model?.count ?? -112}');
  }
}
