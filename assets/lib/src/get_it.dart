import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt _getIt = GetIt.instance;

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    if (!_getIt.isRegistered<AppModel>()) {
      _getIt.registerSingleton<AppModel>(AppModelImplementation(),
          signalsReady: true);
    }
    super.initState();
  }

  @override
  void dispose() {
    _getIt.unregister();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const MyHomePage();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _getIt
        .isReady<AppModel>()
        .then((_) => _getIt<AppModel>().addListener(update));
    super.initState();
  }

  @override
  void dispose() {
    _getIt<AppModel>().removeListener(update);
    super.dispose();
  }

  void update() => setState(() => {});

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _getIt.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: Text('GetIt = ${_getIt<AppModel>().counter.toString()}'),
              ),
              floatingActionButton: Wrap(children: [
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
                  onPressed: () => _getIt<AppModel>().incrementCounter(),
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 15),
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () => _getIt<AppModel>().decrementCounter(),
                  backgroundColor: Colors.deepOrange,
                  child: const Icon(Icons.remove),
                ),
              ]),
            );
          }
          return const CircularProgressIndicator();
        },
      );
}

abstract class AppModel extends ChangeNotifier {
  void incrementCounter();
  void decrementCounter();

  int get counter;
}

class AppModelImplementation extends AppModel {
  AppModelImplementation() {
    Future.delayed(const Duration()).then((_) => _getIt.signalReady(this));
  }

  int _counter = 0;

  @override
  int get counter => _counter;

  @override
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  @override
  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
