import 'package:log_by_id/data/get_log.dart';

class GetRecord {
  FetchData fetchData=FetchHttp<String>('');
  late Future<String> data;
  bool isEmpty=true;
  bool notFound=true;

  set path(String path) {
    fetchData.path=path;
    try {
      data = fetchData.getData((str) => str);
      isEmpty=false;
      notFound=false;
      print('222222');
    } catch(_) {
      print('11111');
      isEmpty=true;
      if (fetchData.code==404) {
        notFound=true;
      }
    }
  }

  Future<String> getData() async {
    Future<String> str=Future<String>(() => "");
    return str;
  }

}