import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log2/cubit/cubit_date.dart';
import 'package:log2/model/counter.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Datepicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
          providers: [
          BlocProvider<DateTimeCubit>(
          create:  (_) => DateTimeCubit(DateTime.now())),
          BlocProvider<CounterCubit>(
          create:  (_) => CounterCubit(Counter(11)))
          ],
          child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";
  //DateTime selectedDate = DateTime.now();
  //int v=10;
  late DateTime dateTime;
  //final ValueNotifier<DateTime> selectedDate = ValueNotifier<DateTime>(DateTime.now());

  @override
  Widget build(BuildContext context) {
    dateTime=context.select((DateTimeCubit cubit) => cubit.get());
    print('DateTime $dateTime');
    print('MyHomePage');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Datepicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyText(),
            ElevatedButton(
              onPressed: () {

                _selectDate(context);
                print('pressed');

                //context.read<DateTimeCubit>().changeDate(selectedDate);
                //context.read<DateTimeCubit>().changeDate(selectedDate);
                //v+=10;
                //context.read<CounterCubit>().change(v);

              },
              child: const Text("Choose Date"),
            ),
            //ValueListenableBuilder<DateTime>( valueListenable: selectedDate, builder: (context,value,child) {return Text("${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}");})
            BlocBuilder<DateTimeCubit,DateTime>(builder: (context,state) {print('state = $state');return Text("${state.day}/${state.month}/${state.year}");}),
            ElevatedButton(onPressed: () {context.read<CounterCubit>().change();}, child: const Text('Increment')),
            BlocBuilder<CounterCubit,int>(builder: (context,state) {return Text('$state');}),
            //FutureBuilder<int>(
            //    future: ,
            //    builder: (context, snapshot) {return Text('1');}
            //)

            //BlocBuilder<CounterCubit, int>(builder: (context, state) {print(state);return Text('$state');})

          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: dateTime,
      //initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      //initialEntryMode: DatePickerEntryMode.input
    );
    //print('selected = $selected');

    context.read<DateTimeCubit>().changeDate(selected);

    //if (selected != null && selected != selectedDate) {
    //  selectedDate=selected;
    //  print('change');
    //
    //}
    //print('$selected $selectedDate');
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyText');
    return const Text('123');
  }
}
