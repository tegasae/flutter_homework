import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  List<String> menu=<String>[];

  MyDrawer(this.menu);



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: Text('Меню'),
              decoration: BoxDecoration(color: Colors.blue)),
          for (String i in menu) ListTile(title: Text(i), onTap: () {Navigator.pop(context);},)
        ],
      ),
    );
  }
}