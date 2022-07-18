import 'package:flutter/material.dart';

import '../app/routes.dart';

class MyDrawer extends StatelessWidget {
  Routes routes;
  final String currentName;
  MyDrawer({required this.routes, this.currentName = ''});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              child: Text('Меню'),
              decoration: BoxDecoration(color: Colors.blue)),
          for (RouteItem ri in routes.getAllRoutes())
            if (ri.isView)
            ListTile(
                title: Text(ri.titleName),
                selected: ri.titleName==currentName,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, ri.routeName);
                })
        ],
      ),
    );
  }
}
