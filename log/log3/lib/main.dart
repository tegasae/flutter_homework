import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log2/cubit/cubit_date.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Datepicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          //create:  (_) => DateTimeCubit(DateTime.now()),
          create:  (_) => CounterCubit(10),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  int v=10;
  //final ValueNotifier<DateTime> selectedDate = ValueNotifier<DateTime>(DateTime.now());
  @override
  Widget build(BuildContext context) {
    print('MyHomePage');
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Datepicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(),
            ElevatedButton(
              onPressed: () {
                //_selectDate(context);
                //context.read<DateTimeCubit>().changeDate(selectedDate);
                //context.read<DateTimeCubit>().changeDate(selectedDate);
                v+=10;
                context.read<CounterCubit>().change(v);

              },
              child: Text("Choose Date"),
            ),
            //ValueListenableBuilder<DateTime>( valueListenable: selectedDate, builder: (context,value,child) {return Text("${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}");})
            //BlocBuilder<DateTimeCubit,DateTime>(builder: (context,state) {print('= $state');return Text("${state.day}/${selectedDate.month}/${selectedDate.year}");}),
            BlocBuilder<CounterCubit, int>(builder: (context, state) {print(state);return Text('$state');})

          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      //initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      //initialEntryMode: DatePickerEntryMode.input
    );
    print('selected = $selected');

    //context.read<DateTimeCubit>().changeDate(selected!);
    if (selected != null && selected != selectedDate) {
      selectedDate=selected;

    }
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyText');
    return Text('123');
  }
}
