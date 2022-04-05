import 'package:bloc/bloc.dart';

class DateTimeCubit extends Cubit<DateTime> {
  DateTimeCubit(DateTime dateTime) : super(dateTime);

  void changeDate(DateTime date) {
    print(date);
    return emit(state);
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit(int value) : super(value);

  void change(int value) {
    print('value= $value');
    return emit(state);
  }
}

