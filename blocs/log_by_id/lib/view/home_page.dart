import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_by_id/bloc/log_bloc.dart';

import 'package:log_by_id/data/log.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: BlocProvider(
          create: (_)=>LogRecordBloc()..add(LogRecordFetched()),
          child: const GetLog()
      ),
    );
  }
}


class GetLog extends StatefulWidget {


  const GetLog({Key? key}) : super(key: key);

  @override
  State<GetLog> createState() => _GetLogState();
}

class _GetLogState extends State<GetLog> {

  final _scrollController = ScrollController();

  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       TextField(
         controller: dateinput,
         onTap: () async {

         },
       ),
        Expanded(
          child: BlocBuilder<LogRecordBloc,LogRecordState>(
            builder: (context, state) {

              if (state.status==LogRecordStatus.success) {

                return LogRecords(listLogRecord: state.logs);
              }
              if (state.status==LogRecordStatus.failure)
             {
                //return Text('${snapshot.error}');

                return const Text('Записи не найдены');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class LogRecords extends StatelessWidget {
  final List<LogRecord> listLogRecord;
  LogRecords({Key? key, required this.listLogRecord}) : super(key: key);
  final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: listLogRecord.length,
      itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(listLogRecord[index].id.toString()),
            title: Text(listLogRecord[index].date),
          );
      },

    );
  }
}



