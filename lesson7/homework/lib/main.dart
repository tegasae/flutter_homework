
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';





void main() {
  runApp(const MyApp());
}

class RouteMap {
  static const String homeRoute='/';
  static const String albumRoute='/album';
  static const String groupRoute='/group';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('BUILD!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    const List<List<String>> listMenu=[['Home',RouteMap.homeRoute],['Album',RouteMap.albumRoute]];
    //MyDrawer myDrawer=const MyDrawer(listItems: listMenu);
    MyScaffold homePage=MyScaffold(body: const HomePage(), pageTitle: 'Home Page', routeName: RouteMap.homeRoute,myDrawer: MyDrawer(listItems: listMenu,currentName: RouteMap.homeRoute));
    MyScaffold albumPage=const MyScaffold(body: AlbumPage(pathAssetFile: 'assets/artists.json'),
                                    pageTitle: 'Album Page', routeName:RouteMap.albumRoute,
        myDrawer: MyDrawer(listItems: listMenu,currentName: RouteMap.albumRoute));

    MyScaffold unknownPage=MyScaffold(body: const DefaultPage(message: 'Not found'), pageTitle: '', routeName: 'Not found',myDrawer: MyDrawer(listItems: listMenu));
    MyScaffold groupPage=const MyScaffold(body: Group(), pageTitle: 'Альбомы', routeName: RouteMap.groupRoute);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

        initialRoute: homePage.routeName,
        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(settings: settings,builder: (BuildContext context)=>unknownPage),
        routes: {
          homePage.routeName: (context)=>homePage,
          albumPage.routeName: (context)=>albumPage,
          groupPage.routeName: (context)=>groupPage

        },
        //onGenerateRoute: (RouteSettings settings) {
        //   Album argument;
          //print(settings.name);
         //if (settings.name==groupPage.routeName) {
         //  print(settings.name);
        //     print(settings.arguments);
        //     try {
        //       argument = settings.arguments as Album;
        //     } catch(e) {
        //        //return MaterialPageRoute(builder: (BuildContext context)=>DefaultPage(title: 'Error', message: e.toString()));
        //       return MaterialPageRoute(builder: (BuildContext context)=>MyScaffold(body: DefaultPage(title: 'error', message: e.toString()), pageTitle: 'Error', routeName: 'Error',myDrawer: myDrawer));
        //     }
          //return MaterialPageRoute(builder: (BuildContext context)=>MyScaffold(body: Group(),pageTitle: 'Альбомы',routeName: '/album'));
         // }
        //   return null;
        //},

      //home: HomePage(),
    );
  }
}


class MyDrawer extends StatelessWidget {
  //final String pageName;
  final List<List<String>> listItems;
  const MyDrawer({Key? key, required this.listItems, this.currentName=''}) : super(key: key);

  final String currentName;
//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }
//
// class _MyDrawerState extends State<MyDrawer> {


  @override
  Widget build(BuildContext context) {

      return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('header'),
            decoration: BoxDecoration(color: Colors.blue),
            ),


          //for (var item in listItems.map((item) => getListTile(item[0], item[1])).toList()) item,
          for (var item in listItems.map((item) =>
                  ListTile(
    //title: Text(title),
    title: Text(item[0]),
    selected: currentName==item[1],
    selectedColor: Colors.white,
    selectedTileColor: Colors.blueGrey,
    onTap: (){

    Navigator.pop(context);

    print(Navigator.canPop(context));
    Navigator.pushReplacementNamed(context, item[1]);
    },
    )
          ).toList()) item,
        ],
      ),
    );
  }

// Widget getListTile(String title,String pageName) {
//
//   //Widget getListTile(TemplatePage templatePage) {
//     return ListTile(
//       //title: Text(title),
//       title: Text(title),
//       selected: currentName==pageName,
//       selectedColor: Colors.white,
//       selectedTileColor: Colors.blueGrey,
//       onTap: (){
//
//         Navigator.pop(context);
//
//         print(Navigator.canPop(context));
//         Navigator.pushReplacementNamed(context, pageName);
//       },
//     );
// }

}


class MyScaffold extends StatelessWidget {
  final Widget body;
  final String pageTitle;
  final String routeName;
  final MyDrawer? myDrawer;
  const MyScaffold({Key? key, required this.body, required this.pageTitle,required this.routeName, this.myDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text(pageTitle),
            automaticallyImplyLeading: true),


        drawer: myDrawer,
        body: body
    )
    );
  }
}






class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
          Text('Home'),
        ],
      );
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

    return getData();

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
                          print(snapshot.data![index]);
                          Navigator.pushNamed(context, RouteMap.groupRoute,arguments: snapshot.data![index]);
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

}

class Group extends StatelessWidget {
  //const Group({Key? key, required this.album}) : super(key: key);
  const Group({Key? key}) : super(key: key);
  //final Album album;
  //static String pageName='/group';
  @override
  Widget build(BuildContext context) {

    final album1 = ModalRoute.of(context)!.settings.arguments as Album;
    return SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text(album1.name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
            Text(album1.about)
          ],
        ),
      );
  }
}


class DefaultPage extends StatelessWidget {
  final String message;
  const DefaultPage({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
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