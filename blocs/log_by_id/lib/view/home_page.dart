import 'package:flutter/material.dart';
import 'package:log_by_id/data/get_record.dart';

import '../data/get_log.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: const GetLog(),
    );
  }
}


class GetLog extends StatefulWidget {


  const GetLog({Key? key}) : super(key: key);

  @override
  State<GetLog> createState() => _GetLogState();
}

class _GetLogState extends State<GetLog> {
  //late Future<String> logs;
  //FetchData fetchHttp=FetchHttp<String>('');
  final _scrollController = ScrollController();
  GetRecord getRecord=GetRecord();

  @override
  void initState() {
    super.initState();
    getRecord.path='http://127.0.0.1:8081/api/v1/n/log/22222';
    //fetchHttp.path='http://127.0.0.1:8081/api/v1/n/log/date/2022-07-11';
    //logs=fetchHttp.get((str) => str);


  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getRecord.data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return Text(snapshot.data!.toString());
          return Text(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
          //return const Text('Невозможно загрузить список');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
