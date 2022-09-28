import 'package:flutter/material.dart';

import '../list_services/list_services.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({Key? key}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          DrawerHeader(child: Text('Выберите нужный генератор')),
          Expanded(child: ListServices())
        ],
      ),
    );
  }
}
