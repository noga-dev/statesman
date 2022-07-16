// ignore_for_file: omit_local_variable_types
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomHookExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final StreamController<int> countController =
        _useLocalStorageInt('counter');

    final AsyncSnapshot<int?> count =
        useStream(countController.stream, initialData: 0);

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(child: Text('Counter = ${count.data}')),
        floatingActionButton: Wrap(
          children: [
            FloatingActionButton(
              onPressed: () => countController.add(count.data! + 1),
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () => countController.add(count.data! - 1),
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

StreamController<int> _useLocalStorageInt(
  String key, {
  int defaultValue = 0,
}) {
  final controller = useStreamController<int>(keys: [key]);

  useEffect(
    () {
      final sub = controller.stream.listen((data) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(key, data);
      });
      return sub.cancel;
    },
    [controller, key],
  );

  useEffect(
    () {
      SharedPreferences.getInstance().then<void>((prefs) async {
        final int? valueFromStorage = prefs.getInt(key);
        controller.add(valueFromStorage ?? defaultValue);
      }).catchError(controller.addError);
      return null;
    },
    [controller, key],
  );

  return controller;
}
