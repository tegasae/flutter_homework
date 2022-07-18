import 'package:flutter/material.dart';

import 'drawer.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final String pageTitle;
  final MyDrawer? myDrawer;
  const MyScaffold(
      {Key? key, required this.body, required this.pageTitle, this.myDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar:
            AppBar(title: Text(pageTitle), automaticallyImplyLeading: true),
            drawer: myDrawer,
            body: body));
  }
}
