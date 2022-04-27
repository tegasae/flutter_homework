import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
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
      return compute(parse, data);
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
    final str=
  }
}

