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
  CounterCubit() : super(1) {emit(10);}

  void change() {
    //print('value= $value');
    int value=state;
    value+=10;
    //value+=1;
    //emit(state);
    //emit(value);
    emit(value);
  }
}

