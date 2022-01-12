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
      initialRoute: null,
      //onUnknownRoute: (context)=> const NotFound(),
      routes: {
        '/': (context)=> const StartScreen(),
        '/generate': (context)=>const GenerateNumber(),
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
      body: Center(child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/generate');},child: const Text('Generate Number'))),
    );
  }
}

class GenerateNumber extends StatelessWidget {
  const GenerateNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Number'),
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, '/get');
        },child: const Text('Get Number'))),
    );
  }
}

class GetNumber extends StatelessWidget {
  const GetNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Number')
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, '/generate');
        },child: const Text('Generate Number')))
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