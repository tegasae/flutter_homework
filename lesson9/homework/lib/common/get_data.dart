import 'package:flutter/foundation.dart';
import 'package:homework/models/hotel_json.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



abstract class FetchData<T> {
  final String path;
  //T Function(String) parse;
  late String data='';
  int code=200;

  FetchData(this.path);

  Future<String> way();

  Future<U> get<U>(U Function(String) parse) async {

    await way();
    if (code==200) {
      return compute(parse,data);
    }
    else {
      throw Exception('Failed to load data');
    }
  }
}

class FetchHttp extends FetchData {
  FetchHttp(String path) : super(path);

  @override
  Future<String> way() async {
    final response = await http.get(Uri.parse(path));

    if (response.statusCode==200) {
      code=200;
      data=response.body;
      return data;

    }
    code=404;
    return '';

  }
}


Future<T> fetchDataHttp<T>(String url, T Function(String) parse) async {
  final response = await http.get(Uri.parse(url));
  //late List<Hotel> hotelList;
  if (response.statusCode == 200) {
    //return compute(parseHotelDetails,response.body);
    return compute(parse,response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load hotel details');
  }
}

