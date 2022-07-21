import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_by_id/data/log.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../data/get_record.dart';


part 'log_event.dart';
part 'log_state.dart';


const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class LogRecordBloc extends Bloc<LogRecordEvent, LogRecordState> {
  LogRecordBloc() : super(const LogRecordState()) {
    on<LogRecordFetched>(
      _onLogRecordFetched,
      //transformer: throttleDroppable(throttleDuration),
    );
  }



  Future<void> _onLogRecordFetched(
      LogRecordFetched event,
      Emitter<LogRecordState> emit,
      ) async {
    try {
      if (state.status == LogRecordStatus.initial) {
        final logs = await _fetchLogRecord();
        return emit(
            LogRecordState(status: LogRecordStatus.success, logs: logs));
      }
    }catch (_) {
      emit(LogRecordState(status: LogRecordStatus.failure));
    }

  }
  Future<List<LogRecord>> _fetchLogRecord() async {
    GetRecord getRecord=GetRecord();
    Future<List<LogRecord>> listLogRecord=getRecord.getString('http://127.0.0.1:8081/api/v1/n/log/');
    return listLogRecord;

  }
}

