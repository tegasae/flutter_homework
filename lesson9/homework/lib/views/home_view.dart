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
  late Future<String> hotels;


  @override
  void initState() {
    super.initState();
    hotels = fetchHotels(
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: hotels,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!.toString());
          return Text(snapshot.data!.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

Future<String> fetchHotels(String url) async {
  final response = await http.get(Uri.parse(url));
  late List<Hotel> hotelList;
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return response.body;

    hotelList=(json.decode(response.body) as List).map((i)=>Hotel.fromJson(i)).toList();
    //hotelList=compute();

    return hotelList.toString();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
