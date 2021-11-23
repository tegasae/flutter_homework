import 'dart:math';

import 'package:flutter/material.dart';
void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  Color myColor = UniqueColorGenerator.getColor();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
  }
}



class UniqueColorGenerator {
  static List colorOptions = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.indigo,
    Colors.amber,
    Colors.black,
  ];
  static Random random = Random();
  static Color getColor() {
    if (colorOptions.length > 0) {
      return colorOptions.removeAt(random.nextInt(colorOptions.length));
    } else {
      return Color.fromARGB(random.nextInt(256), random.nextInt(256),
          random.nextInt(256), random.nextInt(256));
    }
  }
}
