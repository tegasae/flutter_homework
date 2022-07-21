part of 'log_bloc.dart';

enum LogRecordStatus { initial, success, failure }

class LogRecordState extends Equatable {
  final LogRecordStatus status;
  final List<LogRecord> logs;


  const LogRecordState({
    this.status = LogRecordStatus.initial,
    this.logs = const <LogRecord>[]
  });




  @override
  String toString() {
    //return '''LogState { status: $status, hasReachedMax: $hasReachedMax, posts: ${logs.length} }''';
    return '''LogState { status: $status, logs: ${logs.length} }''';
  }

  @override
  //List<Object> get props => [status, logs, hasReachedMax];
  List<Object> get props => [status, logs];
}
