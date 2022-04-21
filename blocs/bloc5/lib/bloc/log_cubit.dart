import 'package:bloc5/model/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LogState {
  final String data;

  LogState(this.data);

  bool operator ==(Object other) {
    //print(identical(other, this));
    return other.hashCode==hashCode;
  }
  @override
  int get hashCode => data.hashCode;
}

class LogStateDone extends LogState {
  LogStateDone(String data) : super(data);
}

class LogStateWaiting extends LogState {
  LogStateWaiting():super('');
}

class LogCubit extends Cubit<LogState> {
  //DateTime date;
  late Log log;

  LogCubit() : super(LogStateDone(''));

  void getDate(DateTime date) {
    print('cubit $date');
    String data=log.getDate(date);
    emit(LogStateDone(data));
  }

}