import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum({int id=1}) async {

  http.Response response;
  // for (int i=0;i<100;i++) {
  //   response = await http
  //       .get(Uri.parse(
  //       'https://jsonplaceholder.typicode.com/albums/' + id.toString()));
  // }
  sleep(const Duration(seconds: 10));
  response = await http
      .get(Uri.parse(
      'https://jsonplaceholder.typicode.com/albums/' + id.toString()));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

   @override
   void initState() {
     super.initState();
     futureAlbum = fetchAlbum();
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example1'),
        ),
        body: Column(
          children: [
            Center(
              child:
              TextButton(onPressed: (){
                //futureAlbum = fetchAlbum(id:2);
                setState(() {
                  futureAlbum = fetchAlbum(id:2);
                });

              },
                  child: Text('Get data')),
            ),
            Center(
              child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  print('Start');
                  print(snapshot.connectionState);
                  if (snapshot.connectionState==ConnectionState.done) {
                    if (snapshot.hasData) {
                      print('Has data');
                      return Text(snapshot.data!.title);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                  }
                  print('Wait');
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}