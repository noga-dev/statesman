import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class MyApp extends StatefulWidget {
  const MyApp();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Counter counter;

  @override
  void initState() {
    counter = Counter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (BuildContext context) => Text(
            'Mobx = ${counter.state.toString()}',
          ),
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
            onPressed: () => counter.increment(),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => counter.decrement(),
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int state = 0;

  @action
  void increment() => state++;

  @action
  void decrement() => state--;
}

mixin _$Counter on _Counter, Store {
  final _$stateAtom = Atom(name: '_Counter.state');

  @override
  int get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(int value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  // ignore: non_constant_identifier_names
  final _$_CounterActionController = ActionController(name: '_Counter');

  @override
  void increment() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo =
        _$_CounterActionController.startAction(name: '_Counter.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() => 'state: $state';
}
