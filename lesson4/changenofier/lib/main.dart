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
    print('BUILD MyApp');
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
    print('BUILD MyHomePage');
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
            ),
            Expanded(child:ProfileStateless()),
            Expanded(child: ProfileStatefull()),
            Expanded(child: Container(child:TextButton(
                            onPressed: () {
                              print(widget);
                              setState() {
                                print('setState another button');
                              //  print('setState TextButton another button: $widget');
                              }
                            },
              child: Text('Another Button'),
            ))
            ),
            Expanded(child: MyTextButtonAddStatefull())
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
    print('BUILD MyTextButtonAdd');
    var counter=context.watch<Counter>();
    return TextButton(onPressed: () {counter.add();}, child: const Text('Add'));
  }
}

class MyTextButtonSub extends StatelessWidget {
  const MyTextButtonSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD MyTextButtonSub');
    Counter counter=context.watch<Counter>();
    return TextButton(onPressed: (){counter.sub();}, child: const Text('Sub'));
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD MyText');
    return Consumer<Counter>(builder: (context,counter,child) {return Text('${counter.count}');});
  }
}

class ProfileStateless extends StatelessWidget {
  const ProfileStateless({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('BUILD ProfileStateless');
    return TextButton(onPressed: () {setState() {print('setState Stateless');}}, child: Text('Set State Stateless'));
  }
}

class ProfileStatefull extends StatefulWidget {
  const ProfileStatefull({Key? key}) : super(key: key);

  @override
  _ProfileStatefullState createState()=>_ProfileStatefullState();
}

class _ProfileStatefullState extends State<ProfileStatefull> {
  @override
  Widget build(BuildContext context) {
    print('BUILD ProfileStatefull');
    return TextButton(onPressed: () {setState(() {
      print('setState Statefull');
    });}, child: Text('Set State Statefull'));
  }

}

class MyTextButtonAddStatefull extends StatefulWidget {
  const MyTextButtonAddStatefull({Key? key}) : super(key: key);

  _MyTextButtonAddStatefullState createState()=>_MyTextButtonAddStatefullState();
}

class _MyTextButtonAddStatefullState extends State<MyTextButtonAddStatefull> {

  late Counter counter;

  @override
  void initState() {
    print('initState $widget');
    super.initState();

  }
  @override
  void didChangeDependencies() {
    print('didChangeDependencies $widget');
    super.didChangeDependencies();
    counter=context.watch<Counter>();
  }
  @override
  Widget build(BuildContext context) {
    print('BUILD $widget');

    return TextButton(onPressed: (){
      //counter.add();
      print('onPressed $widget');
      },
        child: Text('Statefull add'));
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