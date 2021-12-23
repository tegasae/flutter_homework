import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> nav= ['Список 1', 'Список 2'];

  MyApp({Key? key}) : super(key: key);

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
      home: DefaultTabController(length: nav.length,
      child:
      Scaffold(
          appBar: AppBar(title:Text('Lists'),
                  bottom: TabBar(tabs: nav.map((String item)=>Tab(text: item)).toList()),
                  ),
          body: const MyInheritedWidget(countItems: 150,
          child:
          TabBarView(children: [MyPage(key: PageStorageKey('1')),
                                ListViewSeparator()])
          ),
      )
      )
    );
  }
}

class MyPage extends StatelessWidget {


  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Container(child: Text('Lists'))),
        Expanded(child: MySingleChildScrollView(countItems: MyInheritedWidget.of(context).countItems))
      ],
    );
  }
}


class MySingleChildScrollView extends StatefulWidget {
  final int countItems;
  const MySingleChildScrollView({Key? key, required this.countItems}) : super(key: key);


  @override
  _MySingleChildScrollViewState createState()=>_MySingleChildScrollViewState();
}

class _MySingleChildScrollViewState extends State<MySingleChildScrollView> {
  late final ScrollController _controller;
  String message="";
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the top";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i=0;i<widget.countItems;i++)
            MyCard(title: i.toString())

        ],
      ),
    );
  }

}

class ListViewSeparator extends StatefulWidget {
  const ListViewSeparator({Key? key}) : super(key: key);

  @override
  _ListViewSeparatorState createState()=>_ListViewSeparatorState();
}

class _ListViewSeparatorState extends State<ListViewSeparator> with AutomaticKeepAliveClientMixin{
  final ScrollController _scrollController=ScrollController();
  //List<MyCard> myCard=[];
  List<MyCard> myCard=[for (int i=0;i<10;i++) MyCard(title: i.toString())];
  @override
  void initState() {
    super.initState();
    //for (int i=0;i<25;i++) {
    //  myCard.add(MyCard(title:i.toString()));
    //}
    _scrollController.addListener((

        ) {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          print('Bottom');
          setState(() {

          });
        });
      }
    });
    
  }
  @override
  Widget build(BuildContext context) {
      super.build(context);
      return ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (BuildContext context,int index) {
                    print(widget);
                    if (index==myCard.length-1) {
                      int len=myCard.length;
                      for (int i=0;i<10;i++) {
                        //myCard.add(MyCard(title: (myCard.length + 1).toString()));
                        myCard=[...myCard,MyCard(title: (len+i).toString())];
                      }
                    }
                    print('length ${myCard.length}');
                    //return MyCard(title: index.toString());
                    return myCard[index];
                  },
                  separatorBuilder: (BuildContext context,int index)=>const Divider(),
                  itemCount: myCard.length);
  }

  @override
  bool get wantKeepAlive => true;

}

class MyCard extends StatelessWidget {
  final String title;
  const MyCard({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('Create $title');
    return Card(
      color: Colors.cyanAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child:
        ListTile(title: Text(title)),
    );
  }

}

class MyInheritedWidget extends InheritedWidget {
  final int countItems;
  const MyInheritedWidget({Key? key, required this.countItems,required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
      oldWidget.countItems!=countItems;

  static of(BuildContext context) {
    final MyInheritedWidget? result=context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    return result;

  }


}