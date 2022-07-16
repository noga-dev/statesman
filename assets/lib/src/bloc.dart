import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocOverrides.runZoned(
      () {
        return const CounterPage();
      },
      blocObserver: CounterObserver(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterView(),
      );
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, state) => Text('Bloc = $state'),
          ),
        ),
        floatingActionButton: Wrap(
          children: <Widget>[
            if (ModalRoute.of(context)?.canPop ?? false)
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: FloatingActionButton(
                  onPressed: null,
                  child: BackButton(),
                ),
              ),
            FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              heroTag: UniqueKey(),
              onPressed: () => context.read<CounterCubit>().increment(),
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 15),
            FloatingActionButton(
              key: const Key('counterView_decrement_floatingActionButton'),
              heroTag: UniqueKey(),
              onPressed: () => context.read<CounterCubit>().decrement(),
              backgroundColor: Colors.deepOrange,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
}

class CounterObserver extends BlocObserver {}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
