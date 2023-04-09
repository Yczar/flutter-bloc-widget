import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget/flutter_bloc_widget.dart';

class CounterWidget extends FlutterBlocWidget<CounterBloc, int> {
  CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  final CounterBloc blocInitializer = CounterBloc();

  @override
  Widget build(
    BuildContext context,
    CounterBloc bloc,
    int state,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          state.toString(),
          style: const TextStyle(fontSize: 72.0),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              bloc.add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((event, emit) {
      emit((state + 1));
    });
    on<DecrementCounterEvent>((event, emit) => emit((state - 1)));
    // on<CounterEvent>((event, emit) => emit(state + 1));
  }
}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

abstract class CounterEvent {}
