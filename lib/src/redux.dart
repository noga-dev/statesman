import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:statesman/common.dart';

// ignore: constant_identifier_names
enum Actions { Increment, Decrement }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  } else if (action == Actions.Decrement) {
    return state - 1;
  }

  return state;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Home();
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final store = Store<int>(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return FlutterReduxApp(
      store: store,
    );
  }
}

class FlutterReduxApp extends StatelessWidget {
  const FlutterReduxApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        appBar: myAppBar('Redux'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, count) => Text('Count = $count'),
              )
            ],
          ),
        ),
        floatingActionButton: StoreConnector<int, Function(Actions action)>(
          converter: (store) => (action) => action == Actions.Increment
              ? store.dispatch(Actions.Increment)
              : store.dispatch(Actions.Decrement),
          builder: (context, callback) => MyFabs(
            incrementButton: () => callback(Actions.Increment),
            decrementButton: () => callback(Actions.Decrement),
          ),
        ),
      ),
    );
  }
}
