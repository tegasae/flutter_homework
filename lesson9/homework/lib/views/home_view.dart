//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homework/common/get_data.dart';
import 'package:homework/main.dart';



import 'dart:convert';

import 'package:homework/models/hotel_json.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int crossAxisCount=1;

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
              IconButton(onPressed: (){

                setState(() {
                  crossAxisCount=1;
                }

                );
                }, icon: Icon(Icons.list)),
              IconButton(onPressed: (){


                setState(() {
                  crossAxisCount=2;
                });


              }, icon: Icon(Icons.grid_view_sharp)),
            ],
          ),
          body: Center(
            child: InheritedDataProvider<int>(child: SingleChildScrollView(child: ListHotels()),data: crossAxisCount),
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
  FetchHttp fetchHttp=FetchHttp('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

  @override
  void initState() {
    super.initState();
    //hotels = fetchDataHttp(
    //    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301',(String responseBody) => (json.decode(responseBody) as List).map((i)=>Hotel.fromJson(i)).toList());
    hotels=fetchHttp.get((String responseBody) => (json.decode(responseBody) as List).map((i)=>Hotel.fromJson(i)).toList());

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
    final int crossAxisCount=InheritedDataProvider.of<int>(context)?.data;
    print(crossAxisCount);
    //print(crossAxisCount);

    final _scrollController = ScrollController();

      return GridView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          //physics: AlwaysScrollableScrollPhysics(),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,//counter.count,
          ),
          itemCount: listHotels.length,
          itemBuilder: (context, index) {

            return IntrinsicWidth(

              child: GestureDetector(
                onTap: () {print(listHotels[index].uuid);Navigator.pushNamed(context,routeHotel.routeName,arguments: [listHotels[index].uuid,listHotels[index].name]);},
                child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(15.0),
                ),color: Colors.amber,
                    child:

                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child:
                          Column(
                            children: [
                              Image.asset('assets/images/'+listHotels[index].poster,height:150,fit: BoxFit.fill),
                              Expanded(child: Text(listHotels[index].name,maxLines: 2)),
                            Expanded(child: Container(color: Colors.blue,child: const Text('Подробнее')))

                            ],
                          ),
                        ),
                      //[Text(listHotels[index].name,maxLines: 1)],
                      //Container(color: Colors.blue,child: const Text('Подробнее'))



                ),
              ),
            );
          },
        );}

}


class InheritedDataProvider<T> extends InheritedWidget {
  final T data;

  InheritedDataProvider({Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) => data != oldWidget.data;


  static InheritedDataProvider? of<T>(BuildContext context) {
    //final InheritedDataProvider<T>? result=context.dependOnInheritedWidgetOfExactType<InheritedDataProvider<T>>();
    return context.dependOnInheritedWidgetOfExactType<InheritedDataProvider<T>>();
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