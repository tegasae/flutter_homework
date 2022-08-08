import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:homework/bloc_generate/bloc_generate_bloc.dart';

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
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateBloc(),
      child: BlocBuilder<GenerateBloc, GenerateState>(
        buildWhen: (prev,state)=>prev.runtimeType!=state.runtimeType,
        builder: (context, state) {
          return Column(
            children: [
              const Text('123'),
              TextButton(onPressed: () {context.read<GenerateBloc>().add(GenerateNextEvent());}, child: const Text('Get next')),
              TextButton(onPressed: () {context.read<GenerateBloc>().add(GenerateStreamEvent());}, child: const Text('Go!')),
              TextButton(onPressed: () {context.read<GenerateBloc>().add(GenerateStopEvent());}, child: const Text('Stop!')),
            ],

          );
        },
      ),
    );
  }
}

