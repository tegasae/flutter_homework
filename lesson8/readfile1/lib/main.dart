import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Данные из существующего файла:',style: TextStyle(fontWeight: FontWeight.bold)),
              FutureBuilder<String>(
                  //future: compute(Albums.readAlbums,assetBundle),
                  future: rootBundle.loadString('assets/file1.txt', cache: true),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      }
                      if (snapshot.hasError) {
                        return Text('Error ' + snapshot.error.toString());
                      }
                    }
                    return const CircularProgressIndicator();
                  }),
              const Divider(),
              const Text('Данные из несуществующего файла:',style: TextStyle(fontWeight: FontWeight.bold)),
              FutureBuilder<String>(

                  future: rootBundle.loadString('assets/file2.txt', cache: true),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      }
                      if (snapshot.hasError) {
                        return Text('Error ' + snapshot.error.toString());
                      }
                    }
                    return const CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

