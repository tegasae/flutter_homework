import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:managers1/models/get_data.dart';
import 'package:managers1/models/log.dart';
import
'package:managers1/view/myscaffold.dart';

import '../app/routes.dart';

class LogPage extends StatelessWidget {

  const LogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () async {
            //Navigator.pushNamed(context, '/logedit');
            //FetchData<LogRecord> fetchData=FetchFile<LogRecord>(path);
            FetchData fetchData=FetchFile<LogRecord>('assets/log.json');
            late Future<List<LogRecord>>? logs;
            logs = fetchData.get((String responseBody) =>
                (json.decode(responseBody) as List)
                    .map((i) => LogRecord.fromJson(i))
                    .toList());
            List<LogRecord> logRecord=await logs;
            print(logRecord[0].timeS);

          },
          title: const Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),
        const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),
        const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),const ListTile(
          title: Text('wrgr erg erg  rg erg ewg erg ewg erg eg eg ewg ewg eg erg eg re erg reg reg erg erg er'),
        ),
        const Divider(),
      ],
    );
  }
}
