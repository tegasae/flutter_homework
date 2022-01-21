import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
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
  late Future<int> arg;
  bool f=false;
  bool fCompute=false;
  Widget informationWidget() {
    if (f==false) {
      return Text('123');
    }
    return FutureBuilder<int>(
        future: pauseFunction(10),
        initialData: null,
        builder: (context,snapshot) {
          print('Start');
          if (snapshot.connectionState==ConnectionState.done) {
            print('Done');
            if (snapshot.hasData) {
              print('Data');
              print(snapshot.data);

              return Text('${snapshot.data}');
            }
            if (snapshot.hasError) {
              return Text('Error');
            }
          }
          print('Wait');
          return const CircularProgressIndicator();
        });
  }


  Widget informationWidgetCompute() {
    if (fCompute==false) {
      return const Text('Not calculate yet');
    }
    return FutureBuilder<int>(
        future: compute(_runningFunctionTop,10),
        builder: (context,snapshot) {
          print('Start compute');
          if (snapshot.connectionState==ConnectionState.done) {
            print('Done compute');
            if (snapshot.hasData) {
              print('Data compute');
              print(snapshot.data);

              return Text('${snapshot.data}');
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error');
            }
          }
          print('Wait compute');
          return const CircularProgressIndicator();
        });
  }

  Widget informationWidgetIsolate() {
    return FutureBuilder(
        future: parseFunctionIsolate(),
        initialData: null,
        builder: (context, snapshot){
          print('Start isolate');
          if (snapshot.connectionState==ConnectionState.done) {
            print('Done isolate');
            if (snapshot.hasData) {
              print('Data isolate');
              print(snapshot.data);

              return Text('${snapshot.data}');
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error');
            }
          }
          print('Wait isolate');
          return const CircularProgressIndicator();
        }
        );
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
            //arg=pauseFunction(10);
            setState(() {
              f=true;
              //print(1);
              //arg=pauseFunction(10);
              //arg=pauseFunction(10);
            });
          },
          child: const Text('Send to FutureBuilder')
        ),
        informationWidget(),
        TextButton(
            onPressed: () {
              setState(() {
                fCompute=true;
              });
            },
            child: const Text('Send to compute')
        ),
        informationWidgetCompute(),
        TextButton(
            onPressed: () {
              setState(() {
                //fCompute=true;
              });
            },
            child: const Text('Send to isolate')
        ),
        informationWidgetIsolate()
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

  static Future<int> _runningFunctionIsolate(SendPort sendPort) async {

    //int sum=_runningFunction(10);
    int sum=0;
    for (int i = 1; i <= 10; i++) {
      sleep(Duration(seconds: 1));
      sum += i;
    }
    Isolate.exit(sendPort,sum);
  }


  Future<int> pauseFunction(int arg) async {
    return _runningFunction(10);
  }

  Future<int> parseFunctionIsolate() async {
    final receivePort=ReceivePort();
    await Isolate.spawn(_runningFunctionIsolate, receivePort.sendPort);
    return await receivePort.first;
  }
}

int _runningFunctionTop(int arg) {

  int sum = 0;
  for (int i = 1; i <= arg; i++) {
    sleep(Duration(seconds: 1));
    sum += i;
  }
  return sum;
}


