import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';





import 'package:homework/models/hotel_json.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../common/get_data.dart';

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
      future: fetchDataHttp('https://run.mocky.io/v3/'+args,(String responseBody) => HotelDetails.fromJson(json.decode(responseBody))),
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



