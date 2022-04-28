//import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: BlocProvider(
          create: (_)=>CounterCubit(10),
          child: HomePage())
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    int v=11;


    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(children: [
          const Text('Counter'),
          ElevatedButton(
              onPressed: () {
                _selectDate(context);
                v+=2;
                print('value = $v');
                context.read<CounterCubit>().increment(v);
                print('Increment');
              },
              child: const Text('Increment')),
          BlocBuilder<CounterCubit, int>(builder: (context, state) {print('== $state');return Text('$state');})
        ]),
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

class CounterCubit extends Cubit<int> {
  final int start;

  CounterCubit(this.start) : super(start);

  void increment(int v) {
    print('state increment $state');
    emit(state + v);
  }
}

class DateTimeCubit extends Cubit<DateTime> {
  final DateTime dateTime;

  DateTimeCubit(this.dateTime): super(dateTime);

  void change(DateTime dateTime) {

    emit(dateTime);
  }
}