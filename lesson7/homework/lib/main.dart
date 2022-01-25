
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';



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
          //AlbumPage.pageName: (context)=>AlbumPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          print(settings.name);
          if (settings.name=='/album') {
            print(Navigator.canPop(context));
            return MaterialPageRoute(builder: (BuildContext context)=>AlbumPage());
          }
          if (settings.name==Group.pageName) {
            print(settings.arguments);
            return MaterialPageRoute(builder: (BuildContext context)=>Group(album: settings.arguments as Album));
          }
          return null;
        },
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
        Navigator.pushNamed(context, routeName,arguments: {'index':index});

      },
    );
}
}
Widget drawer=MyDrawer();

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
      appBar: AppBar( toolbarHeight: 200,title: const Text('Home'),
        automaticallyImplyLeading: true),
      //drawer: MyDrawer(),
        drawer: drawer,
      body: Column(
        children: [
          const Text('Home'),
          //TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {return const AlbumPage();}));}, child: Text('Album'))
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
  late Future<List<Album>> albums;
  @override
  void initState() {
    super.initState();
    print('init');
    albums=Albums.readAlbums('assets/artists.json');

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
        key: _scaffoldKey,
        appBar:
          AppBar(
              toolbarHeight: 200,
              flexibleSpace: Text('123'),
              leadingWidth: 100,
              leading: Column(
                children: [
                  TextButton.icon(onPressed: ()=> Navigator.pushReplacementNamed(context, HomePage.pageName), icon:  Icon(Icons.arrow_left,color: Colors.white,), label: Text('123',textDirection: TextDirection.ltr,style: TextStyle(color: Colors.green))),
                  Builder(builder: (context) {
                      return Align(alignment: Alignment.topLeft, child: IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu)));
                })
                ],
              ),
              title: const Text('Album'),
            automaticallyImplyLeading: true),

        //drawer: MyDrawer(),
        drawer: drawer,
        body: getData()
    ));
  }

  Widget getData() {

    return FutureBuilder<List<Album>>(
        //future: compute(Albums.readAlbums,assetBundle),
        future: albums,
        builder: (context,snapshot) {
          if (snapshot.connectionState==ConnectionState.done) {
            if (snapshot.hasData) {
              //return Text('${snapshot.data}');


              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {

                    //return ListTile(title: Text('123'));
                    return ListTile(
                        title: Text(snapshot.data![index].name),
                        onTap: () {
                          Navigator.pushNamed(context, Group.pageName,arguments: snapshot.data![index]);
                        },

                    );
                  }
              );
          }
            if (snapshot.hasError) {
              return Text('Error');
            }
          }
          return const CircularProgressIndicator();
        }
    );

    
  }

}

class Group extends StatelessWidget {
  Group({Key? key, required this.album}) : super(key: key);
  Album album;
  static String pageName='/group';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          appBar: AppBar(title: Text(album.name)),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text(album.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                Text(album.about)
              ],
            ),
          ),
        )
    );
  }
}


class Album {
  String name;
  String link;
  String about;
  Album(this.name, this.link, this.about);
  Album.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link= json['link'],
        about=json['about'];

}


class Albums {
    static List<Album> listAlbums=[];


    static Future<List<Album>> readAlbums(String assetsPath) async {


    final String nn=await rootBundle.loadString(assetsPath);//.then((file) => file);

    List<dynamic> n=jsonDecode(nn);
    for (dynamic i in n) {
      listAlbums.add(Album.fromJson(i));
    }
    return listAlbums;
  }


}