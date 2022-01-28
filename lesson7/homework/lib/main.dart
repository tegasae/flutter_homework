
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
        //initialRoute: HomePage.pageName,
        initialRoute: homePageTemplate.pageName,
        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(settings: settings,builder: (BuildContext context)=>unknownPageTemplate.widget),
        routes: {
          homePageTemplate.pageName: (context)=>homePageTemplate.widget,
          albumPageTemplate.pageName: (context)=>albumPageTemplate.widget
          //AlbumPage.pageName: (context)=>AlbumPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          Album argument;
          if (settings.name==Group.pageName) {
            print(settings.arguments);
            try {
              argument = settings.arguments as Album;
            } catch(e) {
               return MaterialPageRoute(builder: (BuildContext context)=>DefaultPage(title: 'Error', message: e.toString()));
            }
            return MaterialPageRoute(builder: (BuildContext context)=>Group(album: argument));
          }
          return null;
        },

      //home: HomePage(),
    );
  }
}


class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key) {
    print('MyDrawer');
  }

  //final String currentName=Navigator.defaultRouteName;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name=Navigator.defaultRouteName;
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        key: PageStorageKey(name),
        children: [
          const DrawerHeader(
            child: Text('header'),
            decoration: BoxDecoration(color: Colors.blue),
            ),
          getListTile('Home', homePageTemplate.pageName),
          getListTile('Album', albumPageTemplate.pageName)
        ],
      ),
    );
  }

Widget getListTile(String title,String pageName) {

  //Widget getListTile(TemplatePage templatePage) {
    return ListTile(
      //title: Text(title),
      title: Text(title),
      selected: name==pageName,
      selectedColor: Colors.white,
      selectedTileColor: Colors.blueGrey,
      onTap: (){
        setState(() {
          print(pageName+' '+name);
          name=pageName;
          print(pageName+' '+name);
          //widget.currentName=pageName;
        });
        Navigator.pop(context);
        //Navigator.pushReplacementNamed(context, routeName);
        print(Navigator.canPop(context));
        Navigator.pushReplacementNamed(context, pageName);
      },
    );
}
  @override
  void dispose() {
    print('Drawer dispose');
    super.dispose();
  }
}
//Widget drawer=MyDrawer();

class TemplatePage {

  Widget widget;
  String pageName;

  TemplatePage(this.widget, {this.pageName =''});
}

TemplatePage homePageTemplate=TemplatePage(HomePage(), pageName: '/');
TemplatePage albumPageTemplate=TemplatePage(AlbumPage(pathAssetFile: 'assets/artists.json'), pageName: '/album');
TemplatePage unknownPageTemplate=TemplatePage(const DefaultPage(title:'Unknown page',message: 'Unknown page'));


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          //toolbarHeight: 200,
          title: const Text('Home'),
        automaticallyImplyLeading: true),
      //drawer: MyDrawer(),
        drawer: MyDrawer(),
      //key: _scaffoldKey,
      body: Column(
        children: const [
          Text('Home'),
        ],
      )
    )
    );
  }

  @override
  void dispose() {
    print('Home Page dispose');
    super.dispose();
  }
}


class AlbumPage extends StatefulWidget {
  final String pathAssetFile;
  const AlbumPage({Key? key,required this.pathAssetFile}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  late Future<List<Album>> albums;
  @override
  void initState() {
    super.initState();

    albums=Albums.readAlbums(widget.pathAssetFile);

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(

        appBar:
          AppBar(
              title: const Text('Album'),
            automaticallyImplyLeading: true),
        drawer: MyDrawer(),
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
                          //Navigator.pushNamed(context, Group.pageName,arguments: '1234');
                        },

                    );
                  }
              );
          }
            if (snapshot.hasError) {
              return Text('Error '+ snapshot.error.toString());


            }
          }
          return const CircularProgressIndicator();
        }
    );

    
  }
  @override
  void dispose() {
    print('Album page dispose');
    super.dispose();
  }
}

class Group extends StatelessWidget {
  const Group({Key? key, required this.album}) : super(key: key);
  final Album album;
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
                Center(child: Text(album.name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                Text(album.about)
              ],
            ),
          ),
        )
    );
  }
}


class DefaultPage extends StatelessWidget {
  final String title;
  final String message;
  const DefaultPage({Key? key, required this.title,required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(message)),
      drawer: MyDrawer(),
    ));
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
    final String nn=await rootBundle.loadString(assetsPath,cache: true);//.then((file) => file);
    if (listAlbums.isEmpty) {
      List<dynamic> n=jsonDecode(nn);
      for (dynamic i in n) {
        listAlbums.add(Album.fromJson(i));
      }
    }
    return listAlbums;
  }


}