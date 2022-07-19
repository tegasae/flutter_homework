import 'package:flutter/material.dart';

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
  late Future<String> logs;
  FetchHttp<String> fetchHttp=FetchHttp<String>('http://192.168.23.2/');

  @override
  void initState() {
    super.initState();
    //fetchHttp.path='https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
    //fetchHttp.path='http://192.168.100.93:8080/api/v1/n/log/38';
    //fetchHttp.path='http://192.168.23.2/';
    //fetchHttp.path='127.0.0.1:8080';
    //fetchHttp.path='http://tandem.vrngmu.ru:8080/';
    logs=fetchHttp.get((str) => str);


  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: logs,
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
}
