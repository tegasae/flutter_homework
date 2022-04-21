import 'package:bloc5/bloc/log_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LogPage extends StatefulWidget {
  LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  String date = "";

  //DateTime dateTime=DateTime.now();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {


    return
      Column(
      children: [
        ElevatedButton(onPressed: (){
          _selectDate(context);
          //context.read<LogCubit>().getDate(selectedDate);
          print(selectedDate);

        }, child: Text('Choose date')),
        //Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
        BlocBuilder<LogCubit,LogState>(builder: (context, state) {
           return Text(state.data);
    })
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      //initialDate: dateTime,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      //initialEntryMode: DatePickerEntryMode.input
    );
    //print('selected = $selected');

    //context.read<DateTimeCubit>().changeDate(selected);

    if (selected != null && selected != selectedDate) {
      selectedDate=selected;
      print('change');
      context.read<LogCubit>().getDate(selectedDate);

    }
    //print('$selected $selectedDate');
  }
}
