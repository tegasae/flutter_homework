import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

abstract class FetchData<T> {
  final String path;

  //T Function(String) parse;
  late String data = '';
  int code = 200;

  FetchData(this.path);

  Future<String> way();

  Future<U> get<U>(U Function(String) parse) async {
    await way();
    if (code == 200) {
      print('compute');
      U v;
      print('data: $data');
      try {
        //return compute(parse, data);
        //v=compute(parse,data);
        v=parse(data);
      } catch(e) {
        print('1111');
        throw Exception('Error format');
      }
      return v;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class FetchHttp extends FetchData {
  FetchHttp(String path) : super(path);

  @override
  Future<String> way() async {
    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      code = 200;
      data = response.body;
      return data;
    }
    code = 404;
    return '';
  }
}

class FetchFile extends FetchData {
  FetchFile(String path) : super(path);

  @override
  Future<String> way() async {
    print('path=$path');
    data=await rootBundle.loadString(path);
    print('str:$data');
    return data;
  }
}

