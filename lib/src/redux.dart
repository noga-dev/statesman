import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
        appBar:
            AppBar(automaticallyImplyLeading: true, title: const Text('Redux')),
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
          builder: (context, callback) => Wrap(
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
                onPressed: () => callback(Actions.Increment),
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: () => callback(Actions.Decrement),
                backgroundColor: Colors.deepOrange,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
