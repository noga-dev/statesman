import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ProviderScope(child: Home());
}

final _counterProvider = StateProvider((ref) => 0);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Consumer(builder: (context, watch, _) {
            final count = watch(_counterProvider).state;
            return Text('Riverpod = $count');
          }),
        ),
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
              onPressed: () => context.read(_counterProvider).state++,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 15),
            FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => context.read(_counterProvider).state--,
              backgroundColor: Colors.deepOrange,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
}
