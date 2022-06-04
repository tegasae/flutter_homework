
import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: const HomeView(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) =>const HomeView(title: 'Animations'),
        '/detail': (BuildContext context) => const DetailPage(),
      },
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.black54, title: Text(widget.title)),
        body: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding:  const EdgeInsets.all(8.0),
        crossAxisCount: 2,
        children: spaces
            .map((space) => GestureDetector(
                    onTap: () {print('${space.id}'); Navigator.pushNamed(context,'/detail',arguments: space);},
                    child: Column(children: [
                  Hero(
                    tag: space.id,
                    child: CircleAvatar(
                        radius: 60, backgroundImage: AssetImage(space.image)),
                  ),
                Material(child: Text(space.description.substring(1,10)))
                ])))
            .toList());
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>  with SingleTickerProviderStateMixin {
  //late AnimationController _controller;
  //late Animation<double> _myAnimation;


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,

  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  IconData currentIcon=Icons.stop;

  //@override
 // void initState() {
 //   super.initState();
 //   _controller = AnimationController(
 //     vsync: this,
  //    duration: Duration(milliseconds: 1200),

  //  );
  //  _myAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

   // _controller.addStatusListener((AnimationStatus status) {
   //   //if (status == AnimationStatus.completed) {
   //   //  _controller.repeat();
   //   //}
   // });
  //}

  @override
  Widget build(BuildContext context) {
    final Space space= ModalRoute.of(context)!.settings.arguments as Space;
    return Scaffold(
      appBar: AppBar(
        title: Text(space.description),
      ),
      body: Column(
        children: [
          Hero(tag: space.id,
              child:
              FadeTransition(

                  opacity: _animation,
                  child: Image.asset(space.image)


              )
          ),
          Material(child: Hero(tag: space.id+'title', child: Text(space.description))),
          IconButton(onPressed: () {print('123');
            //_controller.stop();
            if (_controller.isAnimating) {
              _controller.stop();
              currentIcon=Icons.play_arrow;
            } else {

              _controller.repeat(reverse: true);
              currentIcon=Icons.stop;
            }
            setState(() {

            });
            //if (_controller.status==AnimationStatus.forward) {
            //  print('1234');

            //  _controller.stop();
            //} else {
            //  _controller.reset();
          //_controller.repeat(reverse: true);

            //}
            }, icon: Icon(currentIcon))
        ],
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
}
