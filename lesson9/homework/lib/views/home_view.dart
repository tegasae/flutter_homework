import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:homework/models/hotel_json.dart';


class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(child: ListHotels()),
        ));
  }
}

class ListHotels extends StatefulWidget {

  const ListHotels({Key? key}) : super(key: key);

  @override
  _ListHotelsState createState() => _ListHotelsState();
}

class _ListHotelsState extends State<ListHotels> {
  late Future<List<Hotel>> hotels;


  @override
  void initState() {
    super.initState();
    hotels = fetchHotels(
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
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
    final _scrollController = ScrollController();
    return GridView.builder(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      //physics: AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      ),
      itemCount: listHotels.length,
      itemBuilder: (context, index) {

        return Card(color: Colors.amber,child: Image.asset('assets/images/'+listHotels[index].poster));
      },
    );
  }
}



Future<List<Hotel>> fetchHotels(String url) async {
  final response = await http.get(Uri.parse(url));
  //late List<Hotel> hotelList;
  if (response.statusCode == 200) {

    return compute(parseHotels, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

List<Hotel> parseHotels(String responseBody) {
  //late List<Hotel> hotelList;
  List<Hotel> hotelList=(json.decode(responseBody) as List).map((i)=>Hotel.fromJson(i)).toList();
  print(hotelList[0].uuid);
  return hotelList;
}