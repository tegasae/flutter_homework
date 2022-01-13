import 'package:flutter/material.dart';
import 'dart:math';


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
      initialRoute: '/',
      //onUnknownRoute: (context)=> const NotFound(),
      routes: {
        '/': (context)=> const StartScreen(),
        '/generate': (context)=>GenerateNumber(),
        '/get' : (context) =>const GetNumber()
      },
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Start Screen')
      ),
      body: Center(child: ElevatedButton(
          onPressed: (){
            //Navigator.pushNamed(context, '/generate');},
            Navigator.pushReplacementNamed(context, '/generate');},
            //Navigator.popAndPushNamed(context, '/generate');},
          child: const Text('Generate Number'))),
    );
  }
}

class GenerateNumber extends StatelessWidget {
  GenerateNumber({Key? key}) : super(key: key);
  //int generateInt() {
  //    return Random().nextInt(100);
  //}
  int rand=Random().nextInt(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Number'),
      ),
      body: Column(children: [
        Center(child: Text("$rand")),
        Center(child: ElevatedButton(onPressed: () async {
        //Navigator.pop(context);
        final result=await Navigator.pushNamed(context, '/get',arguments: rand);
        print(result);
         //Navigator.pushNamed(context,'/get');
        },child: const Text('Get Number')))]
      ),
    );
  }
}

class GetNumber extends StatelessWidget {
  const GetNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int rand=0;
    try {
      rand = ModalRoute
          .of(context)!
          .settings
          .arguments as int;
    } catch(e) {
      rand=0;
    }
    print(rand);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Number')
      ),
      body: Column(children:
        [
          Center(child: Text("$rand")),
          Center(child: ElevatedButton(onPressed: (){
            Navigator.pop(context,'data');
            //Navigator.pushNamed(context, '/generate');
            //Navigator.pushNamedAndRemoveUntil(context, '/generate', ModalRoute.withName('/'));
        }   ,child: const Text('Generate Number'))
          )
        ]
      )
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, '/');
        },child: const Text('Start Page')))
    );
  }
}