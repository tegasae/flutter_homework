import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SliverExample(
      ),
    );
  }
}

class SliverExample extends StatefulWidget {


  const SliverExample({Key? key}) : super(key: key);

  //SliverExample({
    //required this.backgroundWidget,
    //required this.bodyWidgets,
  //});

  @override
  _SliverExampleState createState() => _SliverExampleState();
}
class _SliverExampleState extends State<SliverExample> {

  late ScrollController _scrollController;
  late Color backGroundColor;
  final double expandedHeight=200;

  @override
  void initState() {
    super.initState();

    backGroundColor=Colors.black;

    _scrollController = ScrollController()
      ..addListener(
            () => _isAppBarExpanded ?

          backGroundColor!=Colors.blue?
        setState(
              () {

            backGroundColor=Colors.blue;
            print('setState is called1');
          },
        ):{}
            //: _theme != Colors.yellow ?
            :backGroundColor!=Colors.black ?
        setState((){
          print('setState is called2');

          backGroundColor=Colors.black;
        }):{},

      );
  }
  bool get _isAppBarExpanded {
    // print(kToolbarHeight);
    // print(_scrollController.hasClients);
    //print("offset: ${_scrollController.offset}");
    print(200 - kToolbarHeight);
    return _scrollController.hasClients && _scrollController.offset > (expandedHeight - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    // To change the item's color accordingly
    // To be used in multiple places in code
    //Color itemColor = isAppBarExpanded ? Colors.white : Colors.black;

    // In my case PrimaryColor is white,
    // and the background widget is dark

    return Scaffold(
        body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
        SliverAppBar(
        pinned: true,
          expandedHeight: expandedHeight,
          backgroundColor: backGroundColor,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              'Page Title',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            // Not affecting the question.
            //background: widget.backgroundWidget,
             background: Opacity(opacity:0.5,
                  child:Image.network('https://picsum.photos/1200/500',
                    fit: BoxFit.cover,

                  )
              )
          ),
        ),

          SliverToBoxAdapter(child: Text(
              'Hello Body gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg'),),
        ],
        ),
    );
  }
}