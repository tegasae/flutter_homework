import 'dart:async';

import 'package:flutter/material.dart';

import '../data_source/data.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late StreamSubscription subscription;
  GenerateNumber generateNumber=GenerateNumber();
  int number=0;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Conter Page'),
      ),
      body: Center(
        child:
        Column(
          children: [
            Text(number.toString()),
            ElevatedButton(onPressed: () {
              subscription=generateNumber.stream.listen((item) {number=item;
              setState(() {
                print(number);

              });
              });


              }, child: Text('Start')),
            ElevatedButton(onPressed: () {subscription.pause();subscription.pause();subscription.pause();}, child: Text('Pause')),
            ElevatedButton(onPressed: () {subscription.resume();}, child: Text('Resume')),
            ElevatedButton(onPressed: () {subscription.cancel();}, child: Text('Cancel')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
