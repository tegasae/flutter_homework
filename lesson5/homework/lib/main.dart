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
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: Colors.white70,
                  onSurface: Colors.blue,
                  backgroundColor: Colors.grey,
                  textStyle: const TextStyle(
                      //fontSize: 24,
                      //fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.italic,
                  )))

      ),
      home: const HomePage()
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
  PersistentBottomSheetController ?_controller;


  void offBottomSheet() {
    if (_controller!=null) {
      _controller!.close();
      _controller=null;
    }
  }
  void toggleBottomSheet() {
    if (_controller==null) {
      _controller=scaffoldKey.currentState!.showBottomSheet(
              (context) => _BottomSheet());
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
        //_currentTabIndex=0;
      });
    });
  }
  int setIndex() {
    print('setIndex');

    return _currentTabIndex;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
          actions: const [
            _EndDrawerAction(),
          ],
      ),
      drawer: _Drawer(),
      endDrawer: _EndDrawer(),
      body: GestureDetector(onTap: () {print('On tap');offBottomSheet();},
          child: MyInheritedWidget(tabController: _tabController,
          child:_TabBarView())),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState((){
              _tabController.index=index;
              _currentTabIndex=index;
            });
          },
          //currentIndex: _currentTabIndex,
          currentIndex: setIndex(),
          items: [
            for (final item in _tabBar)
              BottomNavigationBarItem(label: item.title,icon: item.icon)
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
        FloatingActionButton(
          onPressed: toggleBottomSheet,
          child: const Icon(Icons.add)
        ),

    );
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}



class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child: Column(
              children: [
                const DrawerHeader(
                    child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.green,
                        backgroundImage:
                        AssetImage('assets/images/drawer.jpg')
                    )),
                const ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.account_box_rounded),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const ListTile(
                  title: Text('Images'),
                  leading: Icon(Icons.image),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextButton(
                                      child: const Text('Выход'), onPressed: () {}))),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  child: const Text('Регистрация'), onPressed: () {}))
                        ],
                      ),
                    ))
              ],
            )));
  }
}




//for enddrawer
class _EndDrawerAction extends StatelessWidget {
  const _EndDrawerAction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: (){
          Scaffold.of(context).openEndDrawer();
        },
        icon: const Icon(Icons.person));
  }
}

class _EndDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:
           Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                      CircleAvatar(
                          radius: 60,
                          //backgroundColor: Colors.green,ts
                          backgroundImage: AssetImage('assets/images/enddrawer.jpg')//NetworkImage('https://picsum.photos/1200/500')
                      ),
                    Text('Text')]
           )
    );
  }
}


//for bottom sheet
class _BottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white30,
        //margin: const EdgeInsets.all(10.0),
        height: 150,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(30.0),
                child: Row(children: const [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.credit_card)),
                  Align(alignment: Alignment.centerLeft, child: Text('Сумма')),
                  Expanded(
                      //flex: 4,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('200 руб')))
                ])),
            Container(
                constraints: BoxConstraints(maxHeight: 50.0),
                child: TextButton(
                    child: const Text('Оплатить'), onPressed: () {})),
          ],
        ));
  }
}


class _TabBarView extends  StatefulWidget {

  

  @override
  _TabBarViewState createState()=>_TabBarViewState();
}

class _TabBarViewState extends State<_TabBarView> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context);
    return TabBarView(
      //controller: widget.tabController,
      controller: myInheritedWidget.tabController,
      children: [
        //Center(child: Text('Photo')),
          ListView.builder(itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text(index.toString()));
        }),
        const Center(child: Text('Chat')),
        const Center(child: Text('Album'))

      ],
    );
  }

}

class _ClientListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text(index.toString()));
    },

    );
  }

}


class MyInheritedWidget extends InheritedWidget {
  final TabController tabController;
  const MyInheritedWidget({Key? key, required this.tabController, required Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) => oldWidget.tabController!=tabController;

  static of(BuildContext context) {
    final MyInheritedWidget? result=context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    return result;
  }
}