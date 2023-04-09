import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that subscribes to a BLoC and rebuilds itself when the BLoC's
/// state changes.
abstract class FlutterBlocWidget<B extends BlocBase<S>, S>
    extends StatefulWidget {
  /// FlutterBlocWidget Constructor
  const FlutterBlocWidget({super.key});

  /// The BLoC to subscribe to.
  B get blocInitializer;

  /// Builds the widget's UI based on the BLoC's state.
  @protected
  Widget build(BuildContext context, B bloc, S state);

  @override

  /// This function returns an instance of the `_FlutterBlocWidgetState` class.
  State<FlutterBlocWidget<B, S>> createState() =>
      _FlutterBlocWidgetState<B, S>();
}

class _FlutterBlocWidgetState<B extends BlocBase<S>, S>
    extends State<FlutterBlocWidget<B, S>> {
  late final B _bloc = widget.blocInitializer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<B, S>(
        bloc: _bloc,
        builder: (context, state) {
          return widget.build(context, context.read<B>(), state);
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
