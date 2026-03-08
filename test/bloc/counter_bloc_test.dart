import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/ui/bloc/counter_bloc.dart';
import 'package:counter_bloc/ui/bloc/counter_event.dart';
import 'package:counter_bloc/ui/bloc/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc.close();
    });

    test('El estado inicial debe ser CounterState(counter: 0)', () {
      expect(counterBloc.state.counterValue, 0);
    });

    blocTest<CounterBloc, CounterState>(
      'Debe emitir [CounterState(1)] cuando se agrega CounterIncremented',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterIncremented()),
      expect: () => [
        isA<CounterState>().having((s) => s.counterValue, 'counter', 1),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'Debe emitir [CounterState(-1)] cuando se agrega CounterDecremented',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterDecremented()),
      expect: () => [
        isA<CounterState>().having((s) => s.counterValue, 'counter', -1),
      ],
    );
  });
}
