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
      home: const MyHomePage(),
    );
  }
}





class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homework')),
      body: MyBody(),
      drawer: MyDrawer(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child: TextButton(onPressed: () {  }, child: const Text('123'),));
  }
}

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);
  int index=-1;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  void initState() {
    super.initState();
    print('Init State1');

  }

  @override
  Widget build(BuildContext context) {
    print('build');
    print(widget.index);
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('header'),
            decoration: BoxDecoration(color: Colors.blue),
            ),
          ListTile(
            title: widget.index==0?const Text('123'):const Text('456'),
            selectedColor: Colors.blue,
            selected: false,
            onTap: () {
              setState(() {
                widget.index=0;
                print(widget.index==0);
              });
              Navigator.pop(context);
              },

          ),
          ListTile(
            title: Text("456"),
            selectedColor: Colors.blue,
            selected: widget.index==1,
            onTap: () {
              setState(() {
                widget.index=1;
                print(widget.index);
              });
              Navigator.pop(context);
              },

          )
        ],
      ),
    );
  }
}