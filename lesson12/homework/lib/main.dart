import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/generate_bloc.dart';

import 'data/random_int.dart';


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
      create: (_)=>RandomBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Random')),
        body: Column(
          children: [
            const RandomView(),
            const Buttons()
          ],
        ),
      ),
    );
  }
}



class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomBloc,GenerateState>(
      buildWhen: (prev,state) =>prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        print(state);
        return Column(children: [
        ElevatedButton(onPressed: () =>context.read<RandomBloc>().add(const GenerateStartedEvent()), child: const Text('Start')),
        ElevatedButton(onPressed: () =>context.read<RandomBloc>().add(const GeneratePausedEvent()), child: const Text('Pause')),
        ElevatedButton(onPressed: () =>context.read<RandomBloc>().add(const GenerateResumedEvent()), child: const Text('Resume')),
        ElevatedButton(onPressed: () =>context.read<RandomBloc>().add(const GenerateStoppedEvent()), child: const Text('Stop'),)
      ],);}
    );
  }
}

class RandomView extends StatelessWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String value = context.select((RandomBloc bloc) => bloc.state.value.getStr());
    return Text(value);
  }
}
