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
      home: HomePage()
    );
  }
}


class TabItem {
  late String title;
  late Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: "Photo", icon: const Icon(Icons.home)),
  TabItem(title: "Chat", icon: const Icon(Icons.chat)),
  TabItem(title: "Albums", icon: const Icon(Icons.album))
];


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _currentTabIndex=0;

  final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();
  PersistentBottomSheetController ?_controller=null;



  void toggleBottomSheet() {
    if (_controller==null) {
      _controller=scaffoldKey.currentState!.showBottomSheet(
              (context) => Container(
                color: Colors.deepOrange,
                height: 200,
                child: Center(child: Text('Bottom here'),),
              ));
    } else {
      _controller!.close();
      _controller=null;
    }

  }


  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: _tabBar.length, vsync: this);

    _tabController.addListener(() {
      print('Listener');
      setState(() {
        _currentTabIndex=_tabController.index;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      drawer: Drawer(child: Text('Drawer')),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
              color: Colors.green,
              child: const Center(child: Text('1'))
          ),
          Container(
              color: Colors.yellow,
              child: const Center(child: Text('2'))
          ),
          Container(
              color: Colors.purple,
              child: const Center(child: Text('3'))
          )

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState((){
              _tabController.index=index;
              _currentTabIndex=index;
            });
          },
          currentIndex: _currentTabIndex,
          items: [
            for (final item in _tabBar)
              BottomNavigationBarItem(label: item.title,icon: item.icon)
          ]
      ),
      floatingActionButton:
        FloatingActionButton(
          onPressed: toggleBottomSheet,
        ),

    );
  }
}