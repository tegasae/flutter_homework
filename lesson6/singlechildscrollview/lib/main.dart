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
      home: Scaffold(
          appBar: AppBar(title: const Text('Scroll')),
          body: MyColumn()),
    );
  }
}



class MyColumn extends StatefulWidget {
  const MyColumn({Key? key}) : super(key: key);

  @override
  _MyColumnState createState()=>_MyColumnState();
}

class _MyColumnState extends State<MyColumn> {
  String getString() {
    return '1';
  }
  @override
  Widget build(BuildContext context) {
    return
        Column(children: [
          Container(height: 100, color: Colors.green,child:Center(child: MyText())),
          Expanded(child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                print('1');
                return true;
              },
                        child: MySingleChildScrollView())
          )
        ]
        );
  }

}

class MyText extends StatefulWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  _MyTextState createState()=>_MyTextState();
}

class _MyTextState extends State<MyText> {
  String message='123';
  @override
  Widget build(BuildContext context) {
    return Text(message);
  }

}

class MySingleChildScrollView extends StatefulWidget {
  const MySingleChildScrollView({Key? key}) : super(key: key);


  @override
  _MySingleChildScrollViewState createState()=>_MySingleChildScrollViewState();
}

class _MySingleChildScrollViewState extends State<MySingleChildScrollView> {
  final ScrollController _controller=ScrollController(initialScrollOffset: 50.0);

  @override void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset>=_controller.position.maxScrollExtent && !_controller.position.outOfRange) {
        print('bottom');
      }
      if (_controller.offset<=_controller.position.minScrollExtent &&  !_controller.position.outOfRange) {
        print('top');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(children: [
       for (int i=0; i<100;i++)
         MyWidget(myIndex:i)
         //Text('$i')
      ],),
    );
  }
}

class MyWidget extends StatefulWidget {
  final int myIndex;
  const MyWidget({Key? key,required this.myIndex}) : super(key: key);


 @override
 _MyWidgetState createState()=>_MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    print(widget.myIndex);
  }
  @override
  Widget build(BuildContext context) {
    //return Text('${widget.myIndex}');
    //return Container(child: Text('${widget.myIndex}'));
    return Card(shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                child:ListTile(title: Text('${widget.myIndex}')));
  }
}
