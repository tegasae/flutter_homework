
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

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
       initialRoute: HomePage.pageName,
      routes: {
        HomePage.pageName: (context)=>HomePage(),
        AlbumPage.pageName: (context)=>AlbumPage()
      }
      //home: HomePage(),
    );
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
          getListTile('Home', 0,HomePage.pageName),
          getListTile('Albums', 1,AlbumPage.pageName)
        ],
      ),
    );
  }

Widget getListTile(String title,int index,String routeName) {
    return ListTile(
      title: Text(title),
      selected: widget.index==index,
      selectedColor: Colors.white,
      selectedTileColor: Colors.blueGrey,
      onTap: (){
        setState(() {
          widget.index=index;
        });
        //Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
}
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String pageName='/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text('Home'),
        automaticallyImplyLeading: true),
      drawer: MyDrawer(),
      body: Column(
        children: [
          const Text('Home'),
          TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {return const AlbumPage();}));}, child: Text('Album'))
        ],
      )
    )
    );
  }
}


class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);
  static String pageName='/album';

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('init');
    Albums.readAlbums();

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            toolbarHeight: 150,
            leading: Column(
              children: [
                IconButton(
                   icon: Icon(Icons.arrow_back),
                   onPressed: () => Navigator.pop(context),
                 ),
                  IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      Builder(builder: (context) {
        return IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.settings));
      })
              ],
            ),
            title: const Text('Album'),
          automaticallyImplyLeading: true),
        drawer: MyDrawer(),
        body: getData()
    ));
  }

  Widget getData() {

    // var n=Albums.readAlbums('assets/artists.json');
    // print(n);
    return FutureBuilder<String>(
        //future: compute(Albums.parseALbum,''),
        future: Albums.data,
        builder: (context,snapshot) {
          if (snapshot.connectionState==ConnectionState.done) {

          print('Done compute');
          print(snapshot.hasData);
          if (snapshot.hasData) {

          print('Data compute1');

          print('null');

          print(snapshot.data);

            return Text('${snapshot.data}');
            //return Text('1234');
          }
          if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Error');
          }
          }
          print('Wait compute');
          return const CircularProgressIndicator();
        }
    );
    //return Text('123');
    
  }
  static String generateText(int count) {
    sleep(Duration(seconds: 10));
    return "Album";
  }
}


class Album {
  String name;
  String link;
  String about;
  Album(this.name, this.link, this.about);
}

//Map<String, Album> albums={};

class Albums {
  static Map<String, dynamic> listAlbums={};
  static late Future<String> data;
  static Future<String> readAlbums() async {

    String assetsPath='assets/artists.json';

    // final response = await http
    //      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    // print(response.body);
    // print(assetsPath);
    //final nn=await bundle.loadString(assetsPath);
    //print(nn);
    //final file = await File(assetsPath!);
    //final nn=await file.readAsString();
    final nn=rootBundle.loadString(assetsPath);//.then((file) => file);
    print(nn);
    data=nn;
    print('data');
    return nn;


    // if (listAlbums.isEmpty) {
    //
    // }
    //
    //final nn=await rootBundle.loadString(assetsPath);

    //return nn;
  }

  static Future<String> parseALbum(String n) async {
    print('data1');
    print(data);
    return await data;
  }
}