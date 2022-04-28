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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      setState(() {
        _currentTabIndex = tabController.index;
        //_currentTabIndex=0;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),

      body: _TabBarView(tabController: tabController),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          onTap: (index) {
            setState(() {
              tabController.index = index;
              _currentTabIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Существующий файл', icon: Icon(Icons.file_download)),
            BottomNavigationBarItem(
                label: 'Несуществующий файл', icon: Icon(Icons.file_download)),
          ]),
    );
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class ReadFile extends StatelessWidget {
  final String fileName;

  const ReadFile({Key? key, required this.fileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<String>(
            //future: rootBundle.loadString('assets/file1.txt', cache: true),
            future: fetchFileFromAssets(fileName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                }
                // if (snapshot.hasError) {
                //   return Text('Error ' + snapshot.error.toString());
                // }
              }
              return const CircularProgressIndicator();
            }));
  }
}

class _TabBarView extends StatelessWidget {
  final TabController tabController;

  const _TabBarView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      //controller: myInheritedWidget.tabController,
      children: const [Center(child: ReadFile(fileName: 'assets/data.txt')), Center(child: ReadFile(fileName: 'assets/fwefrgerg.txt'))],
    );
  }
}

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath, cache: true)
      .then((file) => file.toString())
      .catchError((onError) => onError.toString());
}
