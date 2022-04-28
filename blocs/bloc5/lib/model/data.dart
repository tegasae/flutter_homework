import 'dart:convert';

import 'package:bloc5/common/get_data.dart';
import 'package:bloc5/model/log_json.dart';
import 'package:intl/intl.dart';

class Log {
  DateTime dateLog;
  String path='';
  late Future<List<LogRecord>> logRecords;

  Log(this.dateLog);
  void setDate(DateTime date) {
    dateLog=date;
    path = 'assets/log/'+DateFormat('yyyy-MM-dd').format(dateLog)+'.json';
  }
  Future<String> getDate() async {
    FetchFile fetchFile=FetchFile(path);
    logRecords=fetchFile.get((String str)=>(json.decode(str) as List).map((i) => LogRecord.fromJson(i)).toList());
    print(logRecords);
    return Future.delayed(Duration(seconds: 1),()=>path);
    //return 'date:'+dateLog.toString();
  }

}