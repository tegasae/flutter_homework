import 'dart:math';

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


class LogRecordBloc extends Bloc<LogRecordEvent, LogState> {
  GetRecord getRecord=GetRecord();

  LogRecordBloc() : super(const LogRecordState(LogRecordStatus.initial,[])) {

    on<LogRecordFetched>(
      _onLogRecordFetched,
      //transformer: throttleDroppable(throttleDuration),
    );
    on<LogRecordFetchedDate>(_onLogRecordFetchedDate);
    //on<LogRecordFetchId> (_onLogRecordFetchedId);
  }



  Future<void> _onLogRecordFetched(
      LogRecordFetched event,
      Emitter<LogState> emit,
      ) async {
    try {
      if (state.status == LogRecordStatus.initial) {
        final logs = await _fetchLogRecord();
        return emit(
            LogRecordState(LogRecordStatus.success, logs));
      }
    }catch (_) {
      emit(LogRecordState(LogRecordStatus.failure,[]));
    }

  }

  Future<void> _onLogRecordFetchedDate(
      LogRecordFetchedDate event,
      Emitter<LogState> emit,
      ) async {
    try {

      if ((state.status == LogRecordStatus.initial)||(state.status == LogRecordStatus.success)) {
        print('1111111');

        final logs = await _fetchLogRecord(dateTime: event.dateTime);
        return emit(
            LogRecordState(LogRecordStatus.success, logs));
      }
    }catch (_) {
      emit(LogRecordState(LogRecordStatus.failure,[]));
    }

  }

  Future<void> _onLogRecordFetchedId(LogRecordFetchId event,Emitter<LogRecordIdState> emit) async {
    try {
      if ((state.status == LogRecordStatus.initial) ||
          (state.status == LogRecordStatus.success)) {
        final record = await _fetchLogRecordId(id:event.id);
        //emit();
      }
    }catch (_) {
      //emit(const LogState(status: LogRecordStatus.failure));
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
    listLogRecord = getRecord.getListRecord(url);
    return listLogRecord;

  }

  Future<LogRecord> _fetchLogRecordId({int id=0}) {
    String url="http://127.0.0.1:8081/api/v1/n/log/$id";
    return getRecord.getRecordId(url);

  }
}

