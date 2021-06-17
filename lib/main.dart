// ignore_for_file: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:statesman/src/provider.dart' as provider show MyApp;
import 'package:widget_with_codeview/widget_with_codeview.dart';

// import 'src/hooks/hook_custom.dart' as hook_custom
//     show CustomHookFunctionExample;
// import 'src/hooks/hook_effect_builder.dart' as hook_effect_builder
//     show CustomHookExample;
import 'src/hooks/state.dart' as hook show MyApp;
import 'src/inherited_model.dart' as inherited_model show MyApp;
import 'src/inherited_widget.dart' as inherited_widget show MyApp;
import 'src/redux.dart' as redux show MyApp;
import 'src/setstate.dart' as set_state show MyApp;

void main() {
  // const arg = String.fromEnvironment('manager');
  // Widget child;
  // switch (arg) {
  //   case 'provider':
  //     child = const provider.MyApp();
  //     break;
  //   case 'hook':
  //     child = hook.UseStateExample();
  //     break;
  //   case 'inherited_widget':
  //     child = const inherited_widget.MyApp();
  //     break;
  //   default:
  //     throw UnimplementedError('arg=$arg');
  // }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 15,
              children: const [
                StateManager(
                  label: 'setState',
                  src: 'setstate.dart',
                  child: set_state.MyApp(),
                ),
                StateManager(
                  label: 'Inherited Widget',
                  src: 'inherited_widget.dart',
                  child: inherited_widget.MyApp(),
                ),
                StateManager(
                  label: 'Inherited Model',
                  src: 'inherited_model.dart',
                  child: inherited_model.MyApp(),
                ),
                StateManager(
                  label: 'Provider',
                  src: 'provider.dart',
                  child: provider.MyApp(),
                ),
                StateManager(
                  label: 'Hooks useState',
                  src: 'hooks/state.dart',
                  child: hook.MyApp(),
                ),
                StateManager(
                  label: 'Redux',
                  src: 'redux.dart',
                  child: redux.MyApp(),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class StateManager extends StatelessWidget {
  const StateManager(
      {Key? key,
      required this.label,
      required this.child,
      required this.src,
      this.codeLink = ''})
      : super(key: key);

  final Widget child;
  final String label;
  final String src;
  final String codeLink;

  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
        heroTag: UniqueKey(),
        label: Text(label),
        backgroundColor:
            Colors.accents[Random().nextInt(Colors.accents.length)],
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => WidgetWithCodeView(
                  sourceFilePath: 'lib/src/$src',
                  codeLinkPrefix: codeLink,
                  child: child,
                ))),
      );
}
