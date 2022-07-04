import 'dart:async';
import 'dart:math';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream 6')),
      body: Counter(),
    );
  }
}


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  StreamController<int> randStreamController=StreamController<int>();

  Random rnd = Random();
  int n=0;
  @override
  void initState() {
    super.initState();
    var subscription=randStreamController.stream.listen((event) {print('= $event');n=event;});

  }
  @override
  Widget build(BuildContext context) {
    //StreamSubscription<int> subscription;
    print(n);
    return Column(
      children: [
        Text('111'),
        TextButton(onPressed: () {randStreamController.add(rnd.nextInt(100));setState() {}}, child: const Text('Press button'))
      ],
    );
  }


}



