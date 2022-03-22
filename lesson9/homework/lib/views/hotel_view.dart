import 'dart:convert';


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
            //decoration: BoxDecoration(
            //    border: Border.all(color: Colors.blueAccent)
            //),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            child: Hotel(url: 'https://run.mocky.io/v3/' + args[0]),
          )),
    );
  }
}
Map<String,HotelDetails> cacheHotelDetails={};


class Hotel extends StatelessWidget {
  final String url;

  const Hotel({Key? key, required this.url}) : super(key: key);


  Future<HotelDetails> getFromCache() async {
    if (cacheHotelDetails.containsKey(url)) {
      return cacheHotelDetails[url]!;
    } else {
      FetchHttp fetchHttp = FetchHttp(url);
      return fetchHttp.get((String responseBody) =>HotelDetails.fromJson(json.decode(responseBody)));

      }

    }


  @override
  Widget build(BuildContext context) {

    //FetchHttp fetchHttp = FetchHttp(url);
    final _scrollController = ScrollController();
    return FutureBuilder<HotelDetails>(
        //future: cacheHotelDetails.containsKey(url)?getFromCache():fetchHttp.get((String responseBody) {
        //
        //  return HotelDetails.fromJson(json.decode(responseBody));
        //}),
        future: getFromCache(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            //return Text(snapshot.data!.toString());
            print(snapshot.data!.address.toString());
            HotelDetails hotelDetails = snapshot.data!;
            if (!cacheHotelDetails.containsKey(url)) {
              cacheHotelDetails[url]=hotelDetails;
            }
            print(cacheHotelDetails);
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  CarouselSlider(
                      options: CarouselOptions(height: 200.0),
                      items: hotelDetails.photos
                          .map((e) => Container(padding: EdgeInsets.all(10),child: Image.asset('assets/images/' + e,width: 300,height: 200,fit: BoxFit.fitWidth,)))
                          .toList()),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: RowText(
                          first: 'Страна: ',
                          second: hotelDetails.address.country)),
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
                  const SizedBox(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Сервисы',
                          style: Theme.of(context).textTheme.headline5)),

                  //for (var i in hotelDetails.photos) Expanded(child: Image.asset('assets/images/'+i)),

                  GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        //const SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisCount: 2,
                        childAspectRatio: 0.1,
                      ),
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Платные',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6),
                              for (var i in hotelDetails.services.paid)
                                Text(i,
                                    maxLines: 2, overflow: TextOverflow.ellipsis),

                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Бесплатные',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline6),
                              for (var i in hotelDetails.services.free)
                                Text(i,
                                    maxLines: 2, overflow: TextOverflow.ellipsis)
                            ])
                      ]),
                ],
              ),
            );
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
      Text(second, style: const TextStyle(fontWeight: FontWeight.bold))
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
