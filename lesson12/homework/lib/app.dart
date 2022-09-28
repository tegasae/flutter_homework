import 'package:flutter/material.dart';

import 'package:homework/view/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            headline1: TextStyle(
              fontSize: 100,
              color: Colors.blueAccent,
              fontWeight: FontWeight.normal,
              fontFamily: 'digitalFont',
            ),
            button: TextStyle(
              fontSize: 48,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const SafeArea(child: HomePage()),
      );
}
