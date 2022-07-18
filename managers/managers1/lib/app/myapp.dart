import 'package:flutter/material.dart';
import 'package:managers1/view/drawer.dart';

import '../view/home.dart';
import '../view/log.dart';
import '../view/clients.dart';
import '../view/myscaffold.dart';

import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Routes myRoutes = Routes(routesItem: [
      RouteItem(titleName: 'Home', routeName: '/', routeWidget: HomePage()),
      RouteItem(titleName: 'Log', routeName: '/log', routeWidget: LogPage()),
      RouteItem(titleName: 'Client', routeName: '/client', routeWidget: ClientsPage()),
      RouteItem(titleName: 'LogEdit', routeName: '/logedit', routeWidget: Text('123'),isView: false)
    ]);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: myRoutes.getRoute('/').routeName,
        //myRoutes: {myRoutes.getRoute('/').routeName: (context) => MyScaffold(body: myRoutes.getRoute('/').routeWidget, pageTitle: myRoutes.getRoute('/').titleName, myDrawer: MyDrawer(myRoutes: myRoutes,currentName: myRoutes.getRoute('/').titleName,)),
        //
        //         myRoutes.getRoute('/log').routeName: (context) => MyScaffold(body: myRoutes.getRoute('/log').routeWidget, pageTitle: myRoutes.getRoute('/log').titleName, myDrawer: MyDrawer(myRoutes: myRoutes,currentName: myRoutes.getRoute('/log').titleName,))
        // },
        routes: { for (var e in myRoutes.getAllRoutes()) e.routeName : (context) => MyScaffold(
                body: e.routeWidget,
                pageTitle: e.titleName,
                myDrawer: MyDrawer(routes: myRoutes, currentName: e.titleName)
        ) },
        onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) => MyScaffold(
                  body: myRoutes.getDefaultRoute().routeWidget,
                  pageTitle: myRoutes.getDefaultRoute().titleName,
                  myDrawer: MyDrawer(routes: myRoutes)),
            ));
  }
}

