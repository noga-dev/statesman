import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const ProviderScope(child: MyHomePage());
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useProvider(counterProvider);

    return Scaffold(
      body: Center(child: Text('Riverpod+useProvider = $count')),
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
            onPressed: () => context.read(counterProvider.notifier).increment(),
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () => context.read(counterProvider.notifier).decrement(),
            backgroundColor: Colors.deepOrange,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
