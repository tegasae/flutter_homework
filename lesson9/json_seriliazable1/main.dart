import 'dart:convert';
import 'dart:io';

import 'package:json_serilazable1/hotel.dart';



main() async {
  String str= await readFile('./assets/data.json');
  //print(str);
  List<Hotel> hotelList;
   hotelList = (json.decode(str) as List).map((i)=>Hotel.fromJson(i)).toList();
  print(hotelList[0].name);
  //var hotel = Hotel.fromJson(hotelMap);
  //print(hotel);

}


Future<String> readFile(String path) async {
  try {
    final file = File(path);
    final str = await file.readAsString();
    return str;
  } catch (e) {
    return "";
  }
}