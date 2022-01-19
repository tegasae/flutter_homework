import 'dart:io';

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
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String name='information';

  Widget informationWidget() {
    return FutureBuilder<int>(
        future: pauseFunction(10),
        builder: (context,snapshot) {
          if (snapshot.connectionState==ConnectionState.none) {
            return Text('None');
          }
          return Text('Done');
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Start Page'),
        ),
        body: Column(
      children: [
        TextButton(onPressed: (){
        },
                   child: const Text('Send to isolate')
        ),
        TextButton(
          onPressed: () {
            setState(() {
              name='123';
            });
          },
          child: const Text('Send to FutureBuilder')
        ),
        informationWidget()
      ],
    )
    );
  }


  int _runningFunction(int arg) {
    int sum = 0;
    for (int i = 1; i <= arg; i++) {
      sleep(Duration(seconds: 1));
      sum += i;
    }
    return sum;
  }

  Future<int> pauseFunction(int arg) async {
    return _runningFunction(arg);
  }
}
