import 'package:flutter/material.dart';
import 'package:homework/views/home_view.dart';

import 'views/hotel_view.dart';

void main() {
  runApp(const MyApp());
}

//class RouteMap {
//  static const String homeRoute = '/';
//  static const String hotelRoute = '/hotel';
//}

class RouteWidget {
  final Widget widget;
  final String routeName;

  RouteWidget(this.widget, this.routeName);
}

RouteWidget routeHome=RouteWidget(const HomeView(),'/');
RouteWidget routeHotel=RouteWidget(const HotelView(), '/hotel');

//List<RouteWidget> routeWidget=[RouteWidget(HomeView(),'/'),RouteWidget(HotelView(),'/hotel')];
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('build1');
    //Map<String,Widget Function> m={for (var v in routeWidget) v.routeName:(BuildContext context)=>v.widget};
    //print(m);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        textTheme: const TextTheme(
            button: TextStyle(fontSize: 12, color: Colors.black),
            bodyText1: TextStyle(fontSize: 8, color: Colors.blue),
            bodyText2: TextStyle(fontSize: 16, color: Colors.black,fontFamily: 'Raleway'),
            headline5: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
            subtitle1: (TextStyle(fontSize: 8, color: Colors.black))),
      ),

      initialRoute: routeHome.routeName,

      routes: {
        routeHome.routeName: (BuildContext context) => routeHome.widget,
        routeHotel.routeName: (BuildContext context) => routeHotel.widget,
      },
    );
  }
}
