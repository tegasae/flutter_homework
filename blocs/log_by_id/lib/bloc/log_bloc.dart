import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  GetRecord getRecord=GetRecord();

  LogRecordBloc() : super(const LogRecordState()) {

    on<LogRecordFetched>(
      _onLogRecordFetched,
      //transformer: throttleDroppable(throttleDuration),
    );
    on<LogRecordFetchedDate>(_onLogRecordFetchedDate);
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
      emit(const LogRecordState(status: LogRecordStatus.failure));
    }

  }

  Future<void> _onLogRecordFetchedDate(
      LogRecordFetchedDate event,
      Emitter<LogRecordState> emit,
      ) async {
    try {

      if ((state.status == LogRecordStatus.initial)||(state.status == LogRecordStatus.success)) {
        print('1111111');

        final logs = await _fetchLogRecord(dateTime: event.dateTime);
        return emit(
            LogRecordState(status: LogRecordStatus.success, logs: logs));
      }
    }catch (_) {
      emit(const LogRecordState(status: LogRecordStatus.failure));
    }

  }



  Future<List<LogRecord>> _fetchLogRecord({DateTime? dateTime}) async {
    Future<List<LogRecord>> listLogRecord;
    String url="";
    if (dateTime==null) {
        url='http://127.0.0.1:8081/api/v1/n/log/';
    } else {
      String formattedDate =DateFormat('yyyy-MM-dd').format(dateTime);
      url='http://127.0.0.1:8081/api/v1/n/log/date/$formattedDate';
    }
    print(url);
    listLogRecord = getRecord.getString(url);
    return listLogRecord;

  }
}

