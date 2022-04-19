import 'package:bloc4/model/count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  final int result;
  CounterState(this.result);
  @override
  bool operator ==(Object other) {
      return identical(other, this);
  }
}





class CounterCubit extends Cubit<CounterState> {
  Counter counter=Counter(0);

  CounterCubit() : super(CounterState(0));
  //CounterCubit() : super(10);

  void increment(int i) {

    counter.increment(i:i);

    emit(CounterState(counter.count));
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    print('change $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}