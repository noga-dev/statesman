// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child: const MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Provider = ${context.watch<Counter>().count}'),
          ],
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
            onPressed: () => context.read<Counter>().increment(),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => context.read<Counter>().decrement(),
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
