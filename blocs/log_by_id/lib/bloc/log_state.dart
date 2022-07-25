part of 'log_bloc.dart';

enum LogRecordStatus { initial, success, failure }
abstract class LogState extends Equatable {
  final LogRecordStatus status=LogRecordStatus.initial;
  final List<LogRecord>? logs=null;
  final LogRecord? record=null;
  const LogState({required LogRecordStatus status, List<LogRecord>? logs,LogRecord? record});
}


class LogRecordState extends LogState {

  const LogRecordState(LogRecordStatus status,List<LogRecord> logs) : super(status: status,logs: logs,record: null);


  @override
  String toString() {
    //return '''LogState { status: $status, hasReachedMax: $hasReachedMax, posts: ${logs.length} }''';
    return '''LogState { status: $status, logs: ${logs!.length} }''';
  }

  @override
  //List<Object> get props => [status, logs, hasReachedMax];
  List<Object> get props => [status, logs!];
}

class LogRecordIdState extends LogState {

  const LogRecordIdState(LogRecordStatus status,LogRecord record) : super(status: status,record: record);



  @override
  String toString() {
    return '''LogStateId { status $status, log id ${record!.id} }''';
  }

  @override
  List<Object> get props => [status, record!];
}
