import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// This example emulates the basic Counter app generated by the
/// `flutter create` command to demonstrates the `useReducer` hook.
///
/// First, instead of a StatefulWidget, use a HookWidget instead!

@immutable
class State {
  const State({this.counter = 0});
  final int counter;
}

class IncrementCounter {
  IncrementCounter({this.counter = 0});
  int counter;
}

class UseReducerExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Create the reducer function that will handle the actions you dispatch
    State _reducer(State state, IncrementCounter action) {
      return State(counter: state.counter + action.counter);
    }

    final _store = useReducer<State, IncrementCounter>(
      _reducer,
      initialState: const State(),
      initialAction: IncrementCounter(),
    );

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(child: Text('Counter = ${_store.state.counter}')),
        floatingActionButton: Wrap(
          children: [
            FloatingActionButton(
              onPressed: () => _store.dispatch(IncrementCounter(counter: 1)),
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () => _store.dispatch(IncrementCounter(counter: -1)),
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
