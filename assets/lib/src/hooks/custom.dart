import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomHookFunctionExample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useLoggedState(0);

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(child: Text('Counter = ${counter.value}')),
        floatingActionButton: Wrap(
          children: [
            FloatingActionButton(
              onPressed: () => counter.value++,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () => counter.value--,
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

ValueNotifier<T> useLoggedState<T>([T? initialData]) =>
    useState<T>(initialData!);
