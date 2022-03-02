import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'lib/hotel_json.dart';

import 'dart:mirrors';

main()  async {
  List<Hotel> hotelList;
  GetDataHttp getData=GetDataHttp('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
  print('hello');
//<<<<<<< HEAD
  String str=await getData.getData();
  print(str);
//=======

  //String str= await getData.getData();
  print(getData.status);
  hotelList = (json.decode(str) as List).map((i)=>Hotel.fromJson(i)).toList();

  for (var i in hotelList) {
    InstanceMirror im = reflect(i);
    ClassMirror classMirror = im.type;
    for (var v in classMirror.declarations.values) {
      var name = MirrorSystem.getName(v.simpleName);
      if (v is VariableMirror) {
        print(name);
        var value=im.getField(v.simpleName);
        print(value);
      }


      //print(i.uuid);
      //print(i.name);
      //print(i.poster);

    }
    HotelDetails hotelDetails;
    GetDataHttp getHotel=GetDataHttp('https://run.mocky.io/v3/'+i.uuid);
    String hotelStr=await getHotel.getData();

    print(getHotel.status);
    if (getHotel.status==200) {
      hotelDetails=HotelDetails.fromJson(json.decode(hotelStr));
      print(hotelDetails.toJson());
    }
  }


//>>>>>>> 55e9cca0b3a8937688b52bb69cbe8d9ae1144343
  //Uri url = Uri.parse('http://192.168.100.1/');
  //var response = await http.get(url).timeout(Duration(seconds: 10));
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${response.body}');
  //final client = RetryClient(http.Client());
  //try {
  //  print(await client.read(Uri.parse('http://example.org')));
  //} finally {
  //  client.close();
  //}

}


class GetDataHttp {

  late final String json;
  late final Uri url;
  late int status;

  GetDataHttp(String url) {
    this.url = Uri.parse(url);
  }

  Future<String> getData() async {
    http.Response response;
    final client = RetryClient(http.Client());
    try {
      response=await client.get(url);
    } finally {
      client.close();
    }
    json=response.body;
    status=response.statusCode;
    return json;
  }






}