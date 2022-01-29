import 'package:flutter/material.dart';

class NavDraw extends StatefulWidget {
  NavDraw({Key? key}) : super(key: key) {
    print('Create drawer!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  }

  @override
  _NavDrawState createState() => _NavDrawState();
}

int selectedIndex = 0;

class _NavDrawState extends State<NavDraw> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            color: const Color(0xff2B4DB9),
            child: const DrawerHeader(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.none,
                        image: NetworkImage(
                            'https://picsum.photos/250?image=9'))), child: null,),
          ),
          _createDrawerItem(
              icon: Icons.timer,
              text: 'Timer',
              isSelected: selectedIndex == 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });

                Navigator.pushReplacementNamed(context, "/page0");
              }),
          _createDrawerItem(
              icon: Icons.history,
              text: 'History',
              isSelected: selectedIndex == 1,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });

                Navigator.pushReplacementNamed(context, "/page1");
              }),
          _createDrawerItem(
              icon: Icons.help,
              text: 'Help & Support',
              isSelected: selectedIndex == 2,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });

                Navigator.pushReplacementNamed(context, "/page2");
              }),
          _createDrawerItem(
              icon: Icons.rate_review,
              text: 'Write a Review',
              isSelected: selectedIndex == 3,
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });

                Navigator.pushReplacementNamed(context, "/page3");
              }),
          const Divider(),
        ],
      ),
    );
  }
}

Widget _createDrawerItem(
    {IconData ?icon, String ?text, GestureTapCallback ?onTap, bool ?isSelected}) {
  return Ink(
    color: isSelected! ? const Color(0xffE3EAFF) : Colors.transparent,
    child: ListTile(
      selected: true,
      hoverColor: Colors.white,
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/page0',
      routes: {
        '/page0': (context) => const Page0(),
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
      },
    );
  }
}

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDraw(),
        appBar: AppBar(
          title: const Text("page 0"),
        ),
        body: const Text("page 0"));

  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDraw(),
        appBar: AppBar(
          title: const Text("page 1"),
        ),
        body: const Text("page 1"));

  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDraw(),
        appBar: AppBar(
          title: const Text("page 2"),
        ),
        body: const Text("page 2"));

  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDraw(),
        appBar: AppBar(
          title: const Text("page 3"),
        ),
        body: const Text("page 3"));

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key ?key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavDraw(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}