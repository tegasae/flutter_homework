import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (BuildContext context) => const HomeView(title: 'Animations'),
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
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 1,
        children: spaces
            .map((space) => GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/detail', arguments: space),
                child: Card(
                  semanticContainer: true,
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    child: Column(children: [
                      Hero(
                        tag: space.id,
                        child: Image(image: AssetImage(space.image)),
                      ),
                      Text(space.description.substring(1, 100))
                    ]),
                  ),
                )))
            .toList());
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  IconData currentIcon = Icons.stop;

  @override
  Widget build(BuildContext context) {
    final Space space = ModalRoute.of(context)!.settings.arguments as Space;
    return Scaffold(
      appBar: AppBar(
        title: Text(space.description),
      ),
      body: Column(
        children: [
          Hero(
              tag: space.id,
              child: FadeTransition(
                  opacity: _animation, child: Image.asset(space.image))),
          Material(
              child: Hero(
                  tag: space.id + 'title', child: Text(space.description))),
          IconButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                  currentIcon = Icons.play_arrow;
                } else {
                  _controller.repeat(reverse: true);
                  currentIcon = Icons.stop;
                }
                setState(() {});
              },
              icon: Icon(currentIcon))
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
