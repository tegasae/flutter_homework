import 'package:bloc/bloc.dart';

main() async {

  final bloc = CounterBloc();
  print(bloc.state); // 0
  bloc.add(CounterIncrementPressed());

  await Future.delayed(Duration.zero);
  print(bloc.state); // 1
  print('123');
  await bloc.close();
}

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      // handle incoming `CounterIncrementPressed` event
      emit(state + 1);
    });
  }
}