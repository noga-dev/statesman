import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScopedModel<Counter>(
        model: Counter(),
        child: const HomePage(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Counter>(
      builder: (BuildContext context, Widget? child, Counter counter) {
        return Scaffold(
          body:
              Center(child: Text('Scoped Model = ${counter.state.toString()}')),
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
              ),
            ],
          ),
        );
      },
    );
  }
}

class Counter extends Model {
  int state = 0;

  void increment() {
    state++;
    notifyListeners();
  }

  void decrement() {
    state--;
    notifyListeners();
  }
}
