import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('Stateless build');
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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: const MyHomePage(title: '123')
      home: ExampleLifeCycle()
      //const Text('123',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.green)),
    );
  }
}

class TextPrint extends StatelessWidget {
  final String name;
  const TextPrint({Key? key, required this.name}):super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TextPrint build');
    //return Text(name,style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.green));
    return Text(name,style: Theme.of(context).textTheme.headline4);
  }

}

class ExampleLifeCycle extends StatefulWidget {
  ExampleLifeCycle({Key? key}) : super(key: key);

  @override
  _ExampleLifeCycleState createState()=> _ExampleLifeCycleState();
}

class _ExampleLifeCycleState extends State<ExampleLifeCycle> {
  int counter=0;

  _ExampleLifeCycleState() {

    print('_ExampleLifeCycleState Constructor ' + '$mounted');
  }

  @override
  initState() {
    super.initState();
    print('ExampleLifeCycleState Init');
    print(this.mounted);
    print('$widget');
  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependicies');
    print('$widget');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextButton(onPressed: () {setState(() {
            counter++;
          });}, child: const Text('Button')),
          CounterWidget(counter: counter)
        ],
      )
    );
  }
}

class CounterWidget extends StatefulWidget{
  CounterWidget({Key? key, required this.counter}): super(key: key);

  final int counter;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> with WidgetsBindingObserver{
  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(oldWidget);
    print('counter = ${oldWidget.counter}');
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    print('didChangeAppLifecycleState $state');

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[Container(child: Text('Counter ${widget.counter}')),
        HomeViewCounter(counter: widget.counter)],
      ),
    );
  }
}

class HomeViewCounter extends StatelessWidget {
  HomeViewCounter({Key? key, required this.counter}): super(key: key);
  final int counter;
  @override
  Widget build(BuildContext build) {
    print('Build StatelessWidget HomeViewcounter');
    return Text('Stateless widget counter: $counter');
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String title1='title1';

  @override
  State<MyHomePage> createState() {
    print('Create state');
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('Init state');
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

    });
  }

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).primaryColor);


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          TextPrint(name: '$_counter')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
