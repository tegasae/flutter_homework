class Log {
  DateTime dateLog;

  Log(this.dateLog);

  String getDate(DateTime date) {
    dateLog=date;
    return 'date:'+dateLog.toString();
  }

}