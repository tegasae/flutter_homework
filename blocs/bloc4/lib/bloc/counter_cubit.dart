import 'package:bloc4/model/count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<Counter> {
  CounterCubit() : super(Counter(10));
  //CounterCubit() : super(10);
void change(int i) {
    //Counter counter=state;
    Counter counter=Counter(state.count);

    counter.increment(i:i);
    //print('cubit1 = ${state.count}');
    //emit(state+1);
    emit(counter);

  }

  @override
  void onChange(Change<Counter> change) {
    super.onChange(change);
    print('change ${change.currentState.count}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}