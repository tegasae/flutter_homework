import 'package:flutter/material.dart';

import '../view/home.dart';
import 'routes.dart';




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Routes routes=Routes(routesItem:  [RouteItem(titleName: 'Home', routeName: '/',routeWidget: HomePage())]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
        initialRoute: routes.getRoute('/home').routeName,
        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => routes.getRoute('/home').routeWidget),
    );
  }
}
