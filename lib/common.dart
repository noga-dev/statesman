import 'package:flutter/material.dart';

class MyFabs extends StatelessWidget {
  const MyFabs({
    Key? key,
    required this.incrementButton,
    required this.decrementButton,
  }) : super(key: key);

  final VoidCallback incrementButton;
  final VoidCallback decrementButton;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: incrementButton,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 15,
        ),
        FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: decrementButton,
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

AppBar myAppBar(String label) =>
    AppBar(automaticallyImplyLeading: true, title: Text(label));
