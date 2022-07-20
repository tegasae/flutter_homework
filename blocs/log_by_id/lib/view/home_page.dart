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
  FetchHttp<String> fetchHttp=FetchHttp<String>('https://yandex.ru/');

  @override
  void initState() {
    super.initState();
    //fetchHttp.path='https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
    fetchHttp.path='http://127.0.0.1:8081/api/v1/n/log/';
    //fetchHttp.path='http://192.168.23.2/';
    //fetchHttp.path='127.0.0.1:8080';
    //fetchHttp.path='http://tandem.vrngmu.ru:8080/app;jsessionid=3E47AB7CA84D015B0269DEA0E5D27A66?back=419103033847&bc=18625f634afbc92d51aed2b21ee98ea1&bp=H4gl7cgruBTA8naCzQeCIUfgUX9kQJsE2VVu8EiX5A0LhB8_slDVV1Ft7ApBujTWtZi_FC3VTo66qw4msYiWXHL1_RqpZLzqJCUq91uvIzI88_N-2jNWLNJF1FkHMkcBNfOmVKmYuCyk&service=bcs&site=419103033848';
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
