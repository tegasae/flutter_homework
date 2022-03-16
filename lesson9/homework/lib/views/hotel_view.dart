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
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    //FetchHttp fetchHttp=FetchHttp('https://run.mocky.io/v3/'+args);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text(args[1])),
          body: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Hotel(url: 'https://run.mocky.io/v3/' + args[0]),
          )),
    );
  }
}

class Hotel extends StatelessWidget {
  final String url;

  const Hotel({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as String;
    FetchHttp fetchHttp = FetchHttp(this.url);
    final _scrollController = ScrollController();
    return FutureBuilder<HotelDetails>(
        future: fetchHttp.get((String responseBody) =>
            HotelDetails.fromJson(json.decode(responseBody))),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return Text(snapshot.data!.toString());
            print(snapshot.data!.address.toString());
            HotelDetails hotelDetails = snapshot.data!;
            return Column(children: [
              CarouselSlider(
                  options: CarouselOptions(height: 100.0),
                  items: hotelDetails.photos
                      .map((e) => Image.asset('assets/images/' + e))
                      .toList()),

              Align(
                  alignment: Alignment.centerLeft,
                  child: RowText(
                      first: 'Страна: ', second: hotelDetails.address.country)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: RowText(
                      first: 'Город: ', second: hotelDetails.address.city)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: RowText(
                      first: 'Улица: ', second: hotelDetails.address.street)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: RowText(
                      first: 'Рейтинг: ',
                      second: hotelDetails.rating.toString())),
              Text(''),
              Align(alignment: Alignment.centerLeft, child: Text('Сервисы')),

              //for (var i in hotelDetails.photos) Expanded(child: Image.asset('assets/images/'+i)),


              Expanded(
                child: GridView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Платные'),
                          for (var i in hotelDetails.services.paid) Text(i)
                        ]),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Бесплатные:'),
                          for (var i in hotelDetails.services.free) Text(i),
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}

class RowText extends StatelessWidget {
  final String first;
  final String second;

  const RowText({Key? key, required this.first, required this.second})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(first),
      Text(second, style: TextStyle(fontWeight: FontWeight.bold))
    ]);
  }
}

class HotelDetailsView extends StatelessWidget {
  final HotelDetails hotelDetails;

  const HotelDetailsView({Key? key, required this.hotelDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
