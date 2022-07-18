part of 'log_bloc.dart';

enum LogStatus { initial, success, failure }

class LogState extends Equatable {
  final LogStatus status;
  //final List<Log> logs;
  final bool hasReachedMax;

  const LogState({
    this.status = LogStatus.initial,
    //this.logs = const <Log>[],
    this.hasReachedMax = false,
  });


  LogState copyWith({
    LogStatus? status,
    //List<Log>? logs,
    bool? hasReachedMax,
  }) {
    return LogState(
      status: status ?? this.status,
      //logs: logs ?? this.logs,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    //return '''LogState { status: $status, hasReachedMax: $hasReachedMax, posts: ${logs.length} }''';
    return '''LogState { status: $status, hasReachedMax: $hasReachedMax }''';
  }

  @override
  //List<Object> get props => [status, logs, hasReachedMax];
  List<Object> get props => [status, hasReachedMax];
}
