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
  //late Future<int> counterValue;

  //StreamCounter streamCounter=StreamCounter();
  //StreamCounterValue streamCounterValue=StreamCounterValue();

  //late StreamSubscription<int> streamSubscription;
  //late StreamSubscription<Future<int>> streamSubscriptionValue;

  BlocCounter blocCounter=BlocCounter();

  @override
  void initState() {
    super.initState();
    blocCounter.subscribeCounter(counter.increment);
    blocCounter.subscribeCounterValue(changeCounterValue);

    //counterValue=counter.fetchInt();

    //streamSubscription=streamCounter.stream.listen((event) {print('event= $event'); return counter.increment();});
    //streamSubscriptionValue=streamCounterValue.stream.listen((event)=>changeCounterValue(event));


  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            //counter.increment();
            //streamCounter.sink.add(1);
            //streamCounterValue.sink.add(counter.fetchInt());
            blocCounter.addCounter(10);
            blocCounter.addCounterValue(counter.fetchInt());
            //blocCounter.addCounterValue(counterValue);
            setState(() {

          });}, child: Text('Increment')),
         FutureBuilder(
             //future: blocCounter//counter.fetchInt(),
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
    //counterValue=i;
  }
  @override
  void dispose() {
    blocCounter.cancel();
    super.dispose();
  }
}


class Counter {
  int count;

  Counter(this.count);

  void increment({int i =1}) {
    count+=i;
    print("count $count");
  }

  Future<int> fetchInt() async {
    //int i=await Future.delayed(Duration(seconds: 1),()=>count);
    //print(i);
    //return i;
    return Future.delayed(Duration(seconds: 2),()=>count);
  }

}


class BlocCounter {
  late StreamCounter streamCounter;
  late StreamCounterValue streamCounterValue;

  late StreamSubscription<int> streamSubscription;
  late StreamSubscription<Future<int>> streamSubscriptionValue;

  BlocCounter() {
    streamCounter=StreamCounter();
    streamCounterValue=StreamCounterValue();
  }

  void addCounter(int counter) {
    streamCounter.sink.add(counter);
  }

  void addCounterValue(Future<int> counterValue) {
    streamCounterValue.sink.add(counterValue);
  }

  void subscribeCounter(Function function) {
    streamSubscription=streamCounter.stream.listen((event) {print("event $event"); return function(i:event);});
  }

  void subscribeCounterValue(Function function) {
    streamSubscriptionValue=streamCounterValue.stream.listen((event)=>function(event));
  }

  void cancel() {
    streamSubscription.cancel();
    streamSubscriptionValue.cancel();
  }
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
