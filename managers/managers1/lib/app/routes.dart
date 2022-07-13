import 'package:flutter/cupertino.dart';

class RouteItem {
  final String titleName;
  final String routeName;
  final Widget routeWidget;
  final bool isView;
  RouteItem({required this.titleName, required this.routeName,required this.routeWidget, this.isView=true});
}

class Routes {
  late final Map<String,RouteItem> _routes={};
  late final int _defaultNumberRoute;
  late RouteItem _defaultNameRoute;
  Routes({required List<RouteItem> routesItem, int defaultNumberRoute=0}) {
    for (RouteItem routeItem in routesItem) {
      print(routeItem.routeName);
      _routes[routeItem.routeName]=routeItem;
    }
    _defaultNameRoute=routesItem[defaultNumberRoute];
    _defaultNumberRoute=defaultNumberRoute;
  }

  RouteItem getRoute(String routeName) {
    if (_routes.containsKey(routeName)) {
      return _routes[routeName]!;
    } else {
      return _defaultNameRoute;
    }
  }
  RouteItem getDefaultRoute() {
    return _defaultNameRoute;
  }


  List<RouteItem> getAllRoutes() {
    List<RouteItem> ri=_routes.entries.map((e) {
      return e.value;
    }).toList();
    return ri;
  }
}