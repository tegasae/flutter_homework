//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homework/common/get_data.dart';
import 'package:homework/main.dart';

import 'package:getwidget/getwidget.dart';

import 'dart:convert';

import 'package:homework/models/hotel_json.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //int crossAxisCount=1;
  final ValueNotifier<int> counterNofifier = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //int count=1;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    counterNofifier.value = 1;
                  },
                  icon: const Icon(Icons.list)),
              IconButton(
                  onPressed: () {
                    counterNofifier.value = 2;
                  },
                  icon: const Icon(Icons.grid_view_sharp)),
            ],
          ),
          body: Center(
            child: InheritedDataProvider<ValueNotifier<int>>(
                child: const SingleChildScrollView(child: ListHotels()),
                data: counterNofifier),
          )),
    );
  }
}

class ListHotels extends StatefulWidget {
  const ListHotels({Key? key}) : super(key: key);

  @override
  _ListHotelsState createState() => _ListHotelsState();
}

class _ListHotelsState extends State<ListHotels> {
  late Future<List<Hotel>> hotels;
  FetchHttp fetchHttp =
  FetchHttp('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

  @override
  void initState() {
    super.initState();
    //hotels = fetchDataHttp(
    //    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301',(String responseBody) => (json.decode(responseBody) as List).map((i)=>Hotel.fromJson(i)).toList());
    hotels = fetchHttp.get((String responseBody) =>
        (json.decode(responseBody) as List)
            .map((i) => Hotel.fromJson(i))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hotel>>(
      future: hotels,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return Text(snapshot.data!.toString());
          return Hotels(listHotels: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

class Hotels extends StatelessWidget {
  final List<Hotel> listHotels;

  const Hotels({Key? key, required this.listHotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final int crossAxisCount=InheritedDataProvider.of<int>(context)?.data;
    final ValueNotifier<int> countValueNotifier =
        InheritedDataProvider
            .of<ValueNotifier<int>>(context)
            ?.data;
    print(countValueNotifier.value);
    //print(crossAxisCount);
    //print(crossAxisCount);

    final _scrollController = ScrollController();

    return ValueListenableBuilder<int>(
        valueListenable: countValueNotifier,
        builder: (context, value, child) {
          double aspectRatio = 1.0;
          double height=MediaQuery
              .of(context)
              .size
              .height;
          double witdth=MediaQuery
              .of(context)
              .size
              .width;

          double heightImage=height/7;
          double heightButton=height/17;
          Widget button= TextButton(

              onPressed: () {}, child: Text(
              'Подробнее'),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        //side: BorderSide(color: Colors.red)
                      )
                  ),
                  foregroundColor: MaterialStateProperty.all(
                      Colors.white),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.blue)
              )
          );
          if (countValueNotifier.value == 1) {
            aspectRatio = 1.5;
            heightImage =height / 4;
            heightButton=height/15;

          }
          print(heightImage);

          return GridView.builder(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            //physics: AlwaysScrollableScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: value, //counter.count,
                childAspectRatio: aspectRatio
            ),
            itemCount: listHotels.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(listHotels[index].uuid);
                  Navigator.pushNamed(context, routeHotel.routeName,
                      arguments: [
                        listHotels[index].uuid,
                        listHotels[index].name
                      ]);
                },
                //Image.asset('assets/images/' + listHotels[index].poster,height: 100)
                child: Card(
                    semanticContainer: true,
                    elevation: 15,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Ink.image(image: AssetImage(
                              'assets/images/' + listHotels[index].poster),
                            height: heightImage,
                            fit: BoxFit.cover,),
                          value==2?Expanded(child: Align(
                            alignment: Alignment.topLeft, child: Container(
                              padding: EdgeInsetsDirectional.all(10),
                              child: Text(listHotels[index].name)),))
                              : Row(children: [Expanded(child: Align(
                            alignment: Alignment.topLeft, child: Container(
                              padding: EdgeInsetsDirectional.all(10),
                              child: Text(listHotels[index].name)),)),
                            TextButton(

                                onPressed: () {}, child: Text(
                                'Подробнее'),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          //side: BorderSide(color: Colors.red)
                                        )
                                    ),
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue)
                                )
                            )
                          ]),
                          value==2?SizedBox(height: heightButton,
                              child: TextButton(

                                  onPressed: () {}, child: Text(
                                  'Подробнее'),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                            //side: BorderSide(color: Colors.red)
                                          )
                                      ),
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.white),
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.blue)
                                  )
                              )
                          ):Text('1234')
                        ]
                    )
                ),
              );
            },
          );
        });
  }

  Widget button(int count,String title) {
    if (count==2) {

    } else {

    }
    return Text('123');
  }
}

class InheritedDataProvider<T> extends InheritedWidget {
  final T data;

  const InheritedDataProvider({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) =>
      data != oldWidget.data;

  static InheritedDataProvider? of<T>(BuildContext context) {
    //final InheritedDataProvider<T>? result=context.dependOnInheritedWidgetOfExactType<InheritedDataProvider<T>>();
    return context
        .dependOnInheritedWidgetOfExactType<InheritedDataProvider<T>>();
    //return result;
  }
}

//Future<List<Hotel>> fetchHotels(String url) async {
//  final response = await http.get(Uri.parse(url));
//  //late List<Hotel> hotelList;
//  if (response.statusCode == 200) {

//    return compute(parseHotels, response.body);
//  } else {
//    // If the server did not return a 200 OK response,
//    // then throw an exception.
//    throw Exception('Failed to load album');
//  }
//}

//Future<T> fetchHotels<T>(String url, T Function(String) parse) async {
//  final response = await http.get(Uri.parse(url));
//
//  if (response.statusCode == 200) {
//    return compute(parse, response.body);
//  } else {
//    // If the server did not return a 200 OK response,
//    // then throw an exception.
//    throw Exception('Failed to load album');
//  }
//}

//T parseHotels<T> (String responseBody) => (json.decode(responseBody) as List).map((i)=>Hotel.fromJson(i)).toList() as T;

//T parseHotels<T>(String responseBody) {
//  //late List<Hotel> hotelList;
//  T hotelList=(json.decode(responseBody) as List).map((i)=>Hotel.fromJson(i)).toList() as T;
//  //print(hotelList[0].uuid);
//  return hotelList;
//}
