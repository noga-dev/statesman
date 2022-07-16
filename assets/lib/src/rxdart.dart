import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CounterBloc counterBloc;

  @override
  void initState() {
    counterBloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterBloc.stream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Scaffold(
          body: Center(child: Text('Rxdart = ${snapshot.data.toString()}')),
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
                onPressed: () => counterBloc.increment(),
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 15),
              FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: () => counterBloc.decrement(),
                backgroundColor: Colors.deepOrange,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CounterBloc {
  CounterBloc() {
    state = 0;
  }

  final BehaviorSubject<int> counter = BehaviorSubject<int>.seeded(0);

  Stream<int> get stream => counter.stream;

  late int state;

  void increment() {
    state += 1;
    counter.sink.add(state);
  }

  void decrement() {
    state -= 1;
    counter.sink.add(state);
  }

  void dispose() {
    counter.close();
  }
}
