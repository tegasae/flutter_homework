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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(title: Text('Counter')),
        body: ViewCounter(),
    )
    );
  }
}



class ViewCounter extends StatefulWidget {
  const ViewCounter({Key? key}) : super(key: key);

  @override
  State<ViewCounter> createState() => _ViewCounterState();
}

class _ViewCounterState extends State<ViewCounter> {
  @override
  Counter counter=Counter(10);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){counter.increment();setState(() {

          });}, child: Text('Increment')),
         FutureBuilder(
             future: counter.fetchInt(),
             builder: (context,snapshot) {
               if ((snapshot.connectionState==ConnectionState.done) && (snapshot.hasData)) {
                 print(snapshot.connectionState);
                 return Text(snapshot.data.toString());

               } else {
                 return CircularProgressIndicator();
               }
             })
        ],
      ),
    );
  }
}


class Counter {
  int count;

  Counter(this.count);

  void increment({int i =1}) {
    count+=i;
  }

  Future<int> fetchInt() async {
    int i=await Future.delayed(Duration(seconds: 2),()=>count);
    print(i);
    return i;
  }
}

