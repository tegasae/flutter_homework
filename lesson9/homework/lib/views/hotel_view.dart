import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';



import 'package:homework/models/hotel_json.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HotelView extends StatelessWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Hotel(),
        ));
  }
}

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    //return Text(args);o
    return FutureBuilder<HotelDetails>(
      future: fetchHotelDetails(args),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          //return Text(snapshot.data!.toString());
          print(snapshot.data!.address.toString());
          HotelDetails hotelDetails=snapshot.data!;
          return Column(children: [Text(hotelDetails.name),
                                  Row(children: [Text(hotelDetails.address.city),
                                                 Text(hotelDetails.address.country),
                                                  Text(hotelDetails.address.street),
                                                  Text(hotelDetails.address.coords.values.toString()),
                                                  Text(hotelDetails.address.zip_code.toString())],
                                                  ),
                                  Text(hotelDetails.price.toString()),
                                  //for (var i in hotelDetails.photos) Expanded(child: Image.asset('assets/images/'+i)),
                                CarouselSlider(
                                          options: CarouselOptions(height: 100.0),
                                          items: hotelDetails.photos.map((e)=>Image.asset('assets/images/'+e)).toList()

                                ),
                                  for (var i in hotelDetails.services.free) Text(i),
                                  for (var i in hotelDetails.services.paid) Text(i)
          ]);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      }
    );
  }
  }

class HotelDetailsView extends StatelessWidget {
  final HotelDetails hotelDetails;
  const HotelDetailsView({Key? key, required this.hotelDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



Future<T> fetchHotelDetails<T>(String url) async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/'+url));
  //late List<Hotel> hotelList;
  if (response.statusCode == 200) {

    return compute(parseHotelDetails,response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load hotel details');
  }
}

T parseHotelDetails<T>(String responseBody) {

  //late List<Hotel> hotelList;
  T hotelDetails=HotelDetails.fromJson(json.decode(responseBody)) as T;


  print(hotelDetails);
  return hotelDetails;
}

