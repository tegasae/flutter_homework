import 'package:flutter/material.dart';

import '../view/home.dart';
import '../view/log.dart';
import 'routes.dart';




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Routes routes=Routes(routesItem:
                          [RouteItem(titleName: 'Home', routeName: '/',routeWidget: HomePage()),
                          RouteItem(titleName: 'Log', routeName: '/log', routeWidget: LogPage())]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
        initialRoute: routes.getRoute('/log').routeName,
        routes: {routes.getRoute('/').routeName: (context) => routes.getRoute('/').routeWidget,
                routes.getRoute('/log').routeName: (context) => routes.getRoute('/log').routeWidget
        },

        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => routes.getRoute('/').routeWidget),
    );
  }
}
