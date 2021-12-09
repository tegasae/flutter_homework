import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      //home: SafeAreaExample()
      //home: const ExpandedExample()
      //home: const CenterExample()
      //home: const AlignExample()
      home: const ColumnRowExample()
    );
  }
}

class SafeAreaExample extends StatefulWidget {
  const SafeAreaExample({Key? key}) : super(key: key);

  @override
  _SafeAreaExampleState createState() => _SafeAreaExampleState();
}

class _SafeAreaExampleState extends State<SafeAreaExample> {
    @override
    Widget build(BuildContext context) {
      return const Scaffold(body: SafeArea(child: Text("Long text. Very very long text.")));
    }
}

class ExpandedExample extends StatefulWidget {
  const ExpandedExample({Key? key}) : super(key: key);

  @override
  _ExpandedExampleState createState()=> _ExpandedExampleState();
}

class _ExpandedExampleState extends State<ExpandedExample> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body:
      Column(
        children: [
          Expanded(
            child: Container(color: Colors.green),
          ),
          Expanded(
            child: Container(color: Colors.red),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.blue),
          )
        ],
      )
    );
  }

}

class CenterExample extends StatelessWidget {
  const CenterExample({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Center(
        child: Text('text'),
      )
    );
  }
}

class AlignExample extends StatelessWidget {
  const AlignExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ),
      )
    );
  }
}

class ColumnRowExample extends StatelessWidget {
  const ColumnRowExample({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(width: 50, height: 50,color: Colors.green),
            Container(width: 50, height: 50,color: Colors.blue),
            Container(width: 50, height: 50,color: Colors.pink)
          ],
        ),
      )

    );
  }
}