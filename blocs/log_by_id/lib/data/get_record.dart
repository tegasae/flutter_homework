import 'dart:convert';

import 'package:log_by_id/data/get_log.dart';
import 'package:log_by_id/data/log.dart';

class GetRecord {
  FetchData fetchData=FetchHttp<LogRecord>('');
  late Future<List<LogRecord>> data;
  //bool isEmpty=true;
  //bool notFound=true;


  Future<List<LogRecord>> getString(String path) {
    fetchData.path=path;
    data = fetchData.getData((String str) =>
        (json.decode(str) as List)
            .map((i) => LogRecord.fromJson(i))
            .toList());
    return data;
  }


}