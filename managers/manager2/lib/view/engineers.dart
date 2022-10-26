

import 'package:flutter/material.dart';

class Engineers extends StatelessWidget {
  const Engineers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 7, itemBuilder: (context,index) { return ListTile(title: Text('$index'),);}),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5, itemBuilder: (context,index) { return ListTile(title: Text('$index'),);}),
          )
        ],

      ),
    );

  }
}
