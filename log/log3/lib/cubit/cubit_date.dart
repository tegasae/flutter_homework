import 'package:bloc/bloc.dart';

class DateTimeCubit extends Cubit<DateTime> {
  DateTimeCubit(DateTime dateTime) : super(dateTime);

  void changeDate(DateTime date) {
    print(date);
    return emit(state);
  }
}