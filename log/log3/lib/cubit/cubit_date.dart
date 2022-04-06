import 'package:bloc/bloc.dart';

class DateTimeCubit extends Cubit<DateTime> {
  //final DateTime dateTime;
  DateTimeCubit(dateTime) : super(dateTime) {print('create');}

  void changeDate(DateTime ?date) {
    //print('emit $date $state');
    if ((date!=null) && (date!=state)) {
      //return emit(state);

      emit(date);
    }

  }
  DateTime get() {
    print('get $state');
    return state;
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit(int value) : super(value);

  void change(int value) {
    print('value= $value');
    value+=1;
    //emit(state);
    emit(value);
  }
}

