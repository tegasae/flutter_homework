import 'dart:async';

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
      home: SafeArea(child: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<int> myStream = StreamInt().stream.asBroadcastStream();
    StreamSubscription<int> subscription=myStream.listen(
            (data) => print('Data: $data'),
      );;
    return Scaffold(
      body:
      Column(children: [
        TextButton(onPressed: () {
          //subscription = myStream.listen(
          //      (data) => print('Data: $data'),
          //);


        }, child: Text('Start')),
        TextButton(onPressed: () {
          subscription.cancel();
        }, child: Text('Stop'))
      ],),
    );
  }
}


class StreamInt {
  StreamInt() {
      Timer.periodic(Duration(seconds: 1), (t) {
        print(t);
        _controller.sink.add(_count);
        _count++;
      });
    }

    int _count = 1;
    StreamController<int> _controller = StreamController<int>();
    Stream<int> get stream => _controller.stream;

  }


