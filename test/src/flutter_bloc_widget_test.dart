import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget/flutter_bloc_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlocWidget', () {
    late TestBloc bloc;
    late TestWidget widget;

    setUp(() {
      bloc = TestBloc();
      widget = const TestWidget();
    });

    tearDown(() {
      bloc.close();
    });

    testWidgets('builds widget with initial state', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.text('Initial state'), findsOneWidget);
    });
    // Todo(@czar): fix errors
    //   testWidgets('rebuilds widget with new state', (tester) async {
    //     await tester.pumpWidget(widget);

    //     bloc.add(TestEvent('New state'));
    //     await tester.pumpAndSettle();

    //     expect(find.text('New state'), findsOneWidget);
    //   });
  });
}

class TestBloc extends Bloc<TestEvent, String> {
  TestBloc() : super('Initial state') {
    on<TestEvent>((event, emit) => emit(event.data));
  }
}

class TestEvent {
  TestEvent(this.data);
  final String data;
}

class TestWidget extends FlutterBlocWidget<TestBloc, String> {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context, TestBloc bloc, String state) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text(state),
    );
  }

  @override
  TestBloc get blocInitializer => TestBloc();
}
