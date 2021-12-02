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
      home: const ExampleKeys(),
    );
  }
}

class ExampleKeys extends StatefulWidget {
  const ExampleKeys({Key? key}) : super(key: key);



  @override
  State<ExampleKeys> createState() => _ExampleKeysState();
}

class _ExampleKeysState extends State<ExampleKeys> {


  @override
  Widget build(BuildContext context) {
    final List<String> nav= ['Список 1', 'Список 2'];
    List<String> fakeData=List.generate(100, (index) => index.toString());

    return DefaultTabController(
        length: nav.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Keys'),
            bottom: TabBar(
              tabs: nav.map((String item)=>Tab(text: item)).toList(),
            ),
          ),
          body: TabBarView(
            children: nav.map((name) {
              print('$name');
              return ListView(
                key: PageStorageKey(name),
                children: <Widget>[
                  for (var item in fakeData) Text('$item'),
                ],
              );
            }).toList(),
          )
        )
    );
  }
}
