import 'package:flutter/material.dart';
import 'package:managers1/view/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Text('HomePage'),
      drawer: MyDrawer(['item1','iten2']),
    );
  }
}
