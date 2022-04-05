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

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
}

class CounterCubit extends Cubit<int> {
  final int start;

  CounterCubit(this.start) : super(start);

  void increment(int v) {
    print('state increment $state');
    emit(state + v);
  }
}
