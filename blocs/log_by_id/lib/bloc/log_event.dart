part of 'log_bloc.dart';



abstract class LogRecordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogRecordFetched extends LogRecordEvent {}
