import 'package:flutter/material.dart';
import 'package:homework/views/home_view.dart';

import 'views/hotel_view.dart';

void main() {
  runApp(const MyApp());
}

class RouteMap {
  static const String homeRoute = '/';
  static const String hotelRoute = '/hotel';
}

class RouteWidget {
  final Widget widget;
  final String routeName;

  RouteWidget(this.widget, this.routeName);
}

RouteWidget routeHome=RouteWidget(HomeView(),'/');
RouteWidget routeHotel=RouteWidget(HotelView(), '/hotel');

//List<RouteWidget> routeWidget=[RouteWidget(HomeView(),'/'),RouteWidget(HotelView(),'/hotel')];
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    //Map<String,Widget Function> m={for (var v in routeWidget) v.routeName:(BuildContext context)=>v.widget};
    //print(m);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //initialRoute: '/',
      //initialRoute: routeWidget[0].routeName,
      initialRoute: routeHome.routeName,
      //routes: {
      //  '/': (BuildContext context) => HomeView(),
      //  '/hotel': (BuildContext context) =>HotelView()
      //},
      //routes: {
      //  for (var v in routeWidget) v.routeName:(BuildContext context)=>v.widget
      //},
      routes: {
        routeHome.routeName: (BuildContext context) => routeHome.widget,
        routeHotel.routeName: (BuildContext context) => routeHotel.widget,
      },
    );
  }
}
