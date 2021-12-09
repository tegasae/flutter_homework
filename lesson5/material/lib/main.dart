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
      home: ScaffoldExample()
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();


}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();
  //PersistentBottomSheetController ?_controller=null;

  // void toggleBottomSheet() {
  //   if (_controller==null) {
  //     _controller=scaffoldKey.currentState!.showBottomSheet(
  //             (context) => Container(
  //               color: Colors.deepOrange,
  //               height: 200,
  //               child: Center(child: Text('Bottom here'),),
  //             ));
  //   } else {
  //     _controller!.close();
  //     _controller=null;
  //   }
  //
  // }
  void openDrawer() {
    print('Open Drawer in');
    if (scaffoldKey.currentState==null) {
      print('null');
    }
    scaffoldKey.currentState!.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('App Bar Text'),
        centerTitle: false,
        actions: [
          Builder (builder:
          (context) =>
              IconButton(
                  onPressed:
                      (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.person))
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
                child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage('https://picsum.photos/1200/500')
              )
            ),
            const ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Favorite'),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {print('TAP');},
              onLongPress: (){print('Long press');},
            ),

          ],
        ),
      ),
      endDrawer:  const Drawer(
        child: Center(child: Text('End Drawer')),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(onPressed: openDrawer, child: Text('Open Drawer'))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 10,
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorite"),
               ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:
        FloatingActionButton.extended(
          onPressed: (){},
          label: Text("Open"),
          icon: Icon(Icons.add),),
      // bottomSheet:
      //   BottomSheet(
      //
      //     builder: (context)=> Container(
      //       color: Colors.greenAccent,
      //       height: 300,
      //       child:
      //         Center(
      //           child: Text('BOTTOM SHEET')
      //         ),
      //     ),
      //     onClosing: () {},
      //   ),
    );
  }
}