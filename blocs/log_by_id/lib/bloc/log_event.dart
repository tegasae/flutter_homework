part of 'log_bloc.dart';



abstract class LogRecordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogRecordFetched extends LogRecordEvent {}

class LogRecordFetchedDate extends LogRecordEvent{
  final DateTime dateTime;

  LogRecordFetchedDate(this.dateTime);

}

class LogRecordFetchId extends LogRecordEvent {
  final int id;
  LogRecordFetchId(this.id);
}
