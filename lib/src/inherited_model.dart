import 'package:flutter/material.dart';

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
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Inherited Model')),
      body: CountModel(
        count: count,
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
            onPressed: () => setState(() => count++),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => setState(() => count--),
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
          ),
        ],
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
