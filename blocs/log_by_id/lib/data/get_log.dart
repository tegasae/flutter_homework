

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



abstract class FetchData<T> {
  String path='';

  //T Function(String) parse;
  late String data = '';
  int code = 200;

  FetchData(this.path);

  Future<String> way();

  Future<T> get<T>(T Function(String) parse) async {
    await way();
    if (code == 200) {

      return compute(parse, data);


    } else {
      throw Exception('Failed to load data');
    }
  }
}

class FetchHttp<T> extends FetchData {
  FetchHttp(String path) : super(path);

  @override
  Future<String> way() async {

    var client = http.Client();
    //final response = await client.get(uri);
    final response = await client.get(Uri.parse(path));

    if (response.statusCode == 200) {
      code = 200;
      data = response.body;
      return data;
    }
    code = 404;
    return '';
  }
}



class FetchFile<T> extends FetchData {
  FetchFile(String path) : super(path);

  @override
  Future<String> way() async {
    data =  await rootBundle.loadString(path, cache: true);

    //if (response.statusCode == 200) {
    //  code = 200;
    //  data = response.body;
    //  return data;
    //}
    //code = 404;
    return data;
  }
}
