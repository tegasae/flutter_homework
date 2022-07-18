part of 'log_bloc.dart';



abstract class LogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends LogEvent {}
