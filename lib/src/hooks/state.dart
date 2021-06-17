import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:statesman/common.dart';

class MyApp extends HookWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Center(child: Text('Counter = ${counter.value}')),
      floatingActionButton: MyFabs(
        incrementButton: () => counter.value++,
        decrementButton: () => counter.value--,
      ),
    );
  }
}
