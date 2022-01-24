import 'dart:math';

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
      initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => const HomePage()
      // },
          onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.pageName:
            return MaterialPageRoute(builder: (BuildContext context) {return const HomePage();});
          case AboutPage.pageName:
            final Map<String, dynamic> args=settings.arguments as Map<String,dynamic>;
            print(args);
            return MaterialPageRoute(fullscreenDialog: true, builder: (BuildContext context) {return const AboutPage();});
          case AnimationPage.pageName:
            return PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation1, Animation animation2) {
              return const AnimationPage();
            },transitionsBuilder: (BuildContext context, Animation animation1, Animation animation2,child){
              return FadeTransition(opacity: animation1 as Animation<double>,child: child);
            });
          default:

        }
      },
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String pageName='/';
  @override
  Widget build(BuildContext context) {
    const int arg=100;
    return Scaffold(
        appBar: AppBar(title: const Text('HomePage')),
        body: Column(
          children: [
            const Text('Home Page'),
            TextButton(onPressed: () {Navigator.pushNamed(context, AboutPage.pageName);}, child: Text('about')),
            TextButton(onPressed: (){Navigator.pushNamed(context, AboutPage.pageName,arguments: {'id':arg});}, child: Text('about with argument')),
            TextButton(onPressed: ()=>Navigator.pushNamed(context, AnimationPage.pageName), child: Text('Animation'))
          ],
        )
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const String pageName='/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AboutPage')),
      body: Column(children: const [
        Text('About Page')
      ],),
    );
  }
}

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);
  static const String pageName='/animation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      backgroundColor: Colors.yellow,
      body: Column(children: const [
        Text('Animation')
      ],),
    );
  }
}
