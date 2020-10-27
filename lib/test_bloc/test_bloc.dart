import 'package:testflutterbloczac/@app.dart';

abstract class OperationEvent {

}

class IncrementEvent extends OperationEvent {

}

class DecrementEvent extends OperationEvent {

}

abstract class ValueState {
  final int value;

  ValueState({this.value = 0});

}

class InitialValueState extends ValueState {

  InitialValueState(): super(value: 0);

}

class WithValueState extends ValueState {

  WithValueState(int value): super(value: value);

}

class TestBloc extends Bloc<OperationEvent, ValueState> {

  TestBloc(): super(InitialValueState());

  increment() => add(IncrementEvent());

  decrement() => add(DecrementEvent());

  Stream<ValueState> mapEventToState(OperationEvent event) async* {
    final currentValue = state.value;

    if(event is IncrementEvent) {
      yield WithValueState(currentValue + 1);
    } else if(event is DecrementEvent) {
      yield WithValueState(currentValue - 1);
    }
  }

}

//final testBloc = TestBloc();