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

  Counter counter=Counter(10);
  late Future<int> counterValue;

  StreamCounter streamCounter=StreamCounter();
  StreamCounterValue streamCounterValue=StreamCounterValue();

  late StreamSubscription<int> streamSubscription;
  late StreamSubscription<Future<int>> streamSubscriptionValue;

  @override
  void initState() {
    super.initState();

    counterValue=counter.fetchInt();

    streamSubscription=streamCounter.stream.listen((event) {print('event= $event'); return counter.increment();});
    streamSubscriptionValue=streamCounterValue.stream.listen((event)=>changeCounterValue(event));


  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            //counter.increment();
            streamCounter.sink.add(1);
            streamCounterValue.sink.add(counter.fetchInt());
            setState(() {

          });}, child: Text('Increment')),
         FutureBuilder(
             future: counterValue,//counter.fetchInt(),
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
  void changeCounterValue(Future<int> i) {
    counterValue=i;
  }
  @override
  void dispose() {
    streamSubscription.cancel();
    streamSubscriptionValue.cancel();
    super.dispose();
  }
}


class Counter {
  int count;

  Counter(this.count);

  void increment({int i =1}) {
    count+=i;
  }

  Future<int> fetchInt() async {
    //int i=await Future.delayed(Duration(seconds: 1),()=>count);
    //print(i);
    //return i;
    return Future.delayed(Duration(seconds: 2),()=>count);
  }

}


class BlocCounter {
  StreamCounter streamCounter=StreamCounter();
  StreamCounterValue streamCounterValue=StreamCounterValue();

  late StreamSubscription<int> streamSubscription;
  late StreamSubscription<Future<int>> streamSubscriptionValue;

  
}

class StreamCounter {
  StreamController<int> _streamController=StreamController<int>();

  StreamCounter();

  Stream<int> get stream=>_streamController.stream;
  StreamSink<int> get sink=>_streamController.sink;
}

class StreamCounterValue {
  final StreamController<Future<int>> _streamController=StreamController<Future<int>>();
  StreamCounterValue();
  Stream<Future<int>> get stream=>_streamController.stream;
  StreamSink<Future<int>> get sink=>_streamController.sink;
}
