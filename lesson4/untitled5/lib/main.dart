import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Counter())
      ],
      child:
        MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(

        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: const <Widget>[
                Text('Left'),
                MyTextButtonAdd(),
                MyText(),
              ],
            ),
            Column(
              children: const <Widget>[
                Text('Right'),
                MyTextButtonSub(),
                MyText(),
              ],
            )
          ],
        ),
      ),

    );
  }
}
class MyTextButtonAdd extends StatelessWidget {
  const MyTextButtonAdd({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('ButtonAdd');
    var counter=context.watch<Counter>();
    return TextButton(onPressed: () {counter.add();}, child: const Text('Add'));
  }
}

class MyTextButtonSub extends StatelessWidget {
  const MyTextButtonSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ButtonSub');
    Counter counter=context.watch<Counter>();
    return TextButton(onPressed: (){counter.sub();}, child: const Text('Sub'));
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyText');
    return Consumer<Counter>(builder: (context,counter,child) {return Text('${counter.count}');});
  }
}
class Counter extends ChangeNotifier {
  int count=0;
  void add() {
    count++;
    notifyListeners();
  }
  void sub() {
    count--;
    notifyListeners();
  }

}