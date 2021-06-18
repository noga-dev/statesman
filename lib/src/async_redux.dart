import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

late Store<int> _store;

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    _store = Store<int>(initialState: 0);

    return StoreProvider<int>(
      store: _store,
      child: const MyHomePageConnector(),
    );
  }
}

class IncrementOrDecrementAction extends ReduxAction<int> {
  IncrementOrDecrementAction({required this.amount});
  final int amount;

  @override
  int reduce() => state + amount;
}

class MyHomePageConnector extends StatelessWidget {
  const MyHomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => MyHomePage(
        counter: vm.counter,
        onIncrement: vm.onIncrement,
        onDecrement: vm.onDecrement,
      ),
    );
  }
}

class Factory extends VmFactory<int, MyHomePageConnector> {
  Factory(widget) : super(widget);

  @override
  ViewModel fromStore() => ViewModel(
        counter: state,
        onIncrement: () => dispatch(IncrementOrDecrementAction(amount: 1)),
        onDecrement: () => dispatch(IncrementOrDecrementAction(amount: -1)),
      );
}

class ViewModel extends Vm {
  ViewModel({
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(equals: [counter]);

  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    this.counter,
    this.onIncrement,
    this.onDecrement,
  }) : super(key: key);

  final int? counter;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Async Redux = $counter')),
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
            onPressed: onIncrement,
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: onDecrement,
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
