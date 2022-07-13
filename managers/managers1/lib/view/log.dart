import 'package:flutter/material.dart';

class LogPage extends StatelessWidget {
  final Drawer? myDrawer;
  const LogPage({Key? key, this.myDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log Page')),
      body: Text('Log Page'),
      drawer: myDrawer,
    );
  }
}
