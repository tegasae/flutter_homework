import 'package:flutter/material.dart';
import 'package:managers1/view/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            //scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              const ListTile(
                title: Text('String String String String String StringStringStringStringString'),
              ),
              const ListTile(
                title: Text('2'),
              ),
              TextButton(onPressed: () {}, child: const Text('Add'))
            ]

          ),
        ),
        Expanded(
          child: ListView(
            //scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                const ListTile(
                  title: Text('1'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                TextButton(onPressed: () {}, child: const Text('Add'))


              ]

          ),
        ),
        Expanded(
          child: ListView(
            //scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                const ListTile(
                  title: Text('1'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                TextButton(onPressed: () {}, child: const Text('Add'))
              ]

          ),
        ),
        Expanded(
          child: ListView(
            //scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                const ListTile(
                  title: Text('1'),
                ),
                const ListTile(
                  title: Text('2'),
                ),
                TextButton(onPressed: () {}, child: const Text('Add'))
              ]

          ),
        ),
        TextButton(onPressed: () {}, child: const Text('Add'))
      ],
    );

  }
}
