import 'package:flutter/material.dart';

import 'package:homework/view/list_services/list_services.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
      child: Column(
        children: const [
          DrawerHeader(child: Text('Выберите нужный генератор')),
          Expanded(child: ListServices())
        ],
      ),
    );
}
