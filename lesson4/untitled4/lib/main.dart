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
      home: const MyHomePage(title: 'name',),
    );
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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const constNameButton='1';
  final String n=constNameButton;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MyInheritedWidget(name: 'name start', child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              n,
              style: Theme.of(context).textTheme.headline4,
            ),
            const MyButton(),
            const MyText()
          ],
        ),
      ),

    ));

  }
}

class MyText extends StatefulWidget {
  const MyText({Key? key}): super(key:key);

  @override
  State<MyText> createState()=> _MyTextState();

}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context);
    print('MyText'+myInheritedWidget.name);
    return TextButton(onPressed: () {setState(() {

    });}, child: Text(myInheritedWidget.name));
  }
}

class MyButton extends StatefulWidget {
  const MyButton({Key? key}):super(key:key);

  //final String name;


  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String name='name 1';
  String name2='name 2';
  String tempName='temp';
  _changeName() {

    setState(() {
      String t=name2;
      name2=name;
      name=t;
    });
  }

  @override
  void initState() {
    super.initState();
    //final myInheritedWidget = MyInheritedWidget.of(context);

    //print(myInheritedWidget.name);
    print('Init State');
    //name2=myInheritedWidget.name;
    //name2=widget.name;

  }

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = MyInheritedWidget.of(context);
    print('MyButton' + myInheritedWidget.name);
    return MyInheritedWidget(name: name2,
                            child: TextButton(onPressed: () {_changeName();},
                        child: Text(name2)));
    //return TextButton(onPressed: () {_changeName();
    //                                  },
    //                  child: Text(name2));
  }
}


class MyInheritedWidget extends InheritedWidget {
  final String name;
  const MyInheritedWidget({Key? key, required this.name, required Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
      name != oldWidget.name;

  static of(BuildContext context) {
    final MyInheritedWidget? result=context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    return result;
  }


}
