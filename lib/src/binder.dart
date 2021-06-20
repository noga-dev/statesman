import 'package:binder/binder.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const BinderScope(child: HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp();
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch(_counterRef);

    return Scaffold(
      body: Center(child: Text('Binder = ${counter.toString()}')),
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
            onPressed: () => context.use(_counterLogicRef).increment(),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => context.use(_counterLogicRef).decrement(),
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

final _counterRef = StateRef(0);

final _counterLogicRef = LogicRef((scope) => CounterLogic(scope));

class CounterLogic with Logic {
  CounterLogic(this.scope);

  @override
  final Scope scope;

  void increment() => update(_counterRef, (int x) => ++x);

  void decrement() => update(_counterRef, (int x) => --x);
}
