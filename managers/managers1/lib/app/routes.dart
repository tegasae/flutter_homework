import 'package:flutter/cupertino.dart';

class RouteItem {
  final String titleName;
  final String routeName;
  final Widget routeWidget;
  RouteItem({required this.titleName, required this.routeName,required this.routeWidget});
}

class Routes {
  late Map<String,RouteItem> routes={};
  final int defaultRoute=0;
  String defaultNameRoute='';
  Routes({required List<RouteItem> routesItem, int defaultRoute=0}) {
    for (RouteItem routeItem in routesItem) {
      print(routeItem.routeName);
      routes[routeItem.routeName]=routeItem;
    }
    defaultNameRoute=routesItem[defaultRoute].routeName;
  }

  RouteItem getRoute(String routeName) {
    if (routes.containsKey(routeName)) {
      return routes[routeName]!;
    } else {
      return routes[defaultNameRoute]!;
    }
  }
}