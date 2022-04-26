class Log {
  DateTime dateLog;

  Log(this.dateLog);
  void setDate(DateTime date) {
    dateLog=date;
  }
  Future<String> getDate() async {
    return Future.delayed(Duration(seconds: 5),()=>'date:'+dateLog.toString());
    //return 'date:'+dateLog.toString();
  }

}