import 'package:bloc/bloc.dart';
import 'package:log2/model/counter.dart';

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
  final Counter counter;
  CounterCubit(this.counter) : super(1) {
    //counter.calculate();emit(10);
    emit(counter.count);
  }

  void change() {
    //print('value= $value');
    //int value=state;
    //counter.calculate();
    //value+=10;
    //value+=1;
    //emit(state);
    //emit(value);
    emit(counter.calculate());
  }
}


