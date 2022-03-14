import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



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

