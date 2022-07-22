import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_by_id/bloc/log_bloc.dart';

import 'package:log_by_id/data/log.dart';
import 'package:intl/intl.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: BlocProvider(
          create: (_) => LogRecordBloc()..add(LogRecordFetched()),
          child: const GetLog()),
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
  TextEditingController dateInput = TextEditingController();

  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    super.initState();
    dateInput.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: dateInput,
          decoration: InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
              labelText: "Enter Date" //label text of field
              ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                dateInput.text =
                    formattedDate; //set output date to TextField value.
                print(pickedDate);
                if (mounted) context.read<LogRecordBloc>().add(LogRecordFetchedDate(pickedDate));
              });


            } else {}
          },
        ),
        Expanded(
          child: BlocBuilder<LogRecordBloc, LogRecordState>(
            builder: (context, state) {
              if (state.status == LogRecordStatus.success) {
                return LogRecords(listLogRecord: state.logs);
              }
              if (state.status == LogRecordStatus.failure) {
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
  final ScrollController _scrollController = ScrollController();
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
