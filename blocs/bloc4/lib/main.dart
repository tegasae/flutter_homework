import 'package:bloc4/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/count.dart';

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
      home: HomePage(),
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocProvider(
      create: (_)=>CounterCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('123')),
        body: ViewCounter(),
      ),
    )
    );
  }
}



class ViewCounter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {
        //print(context.watch<CounterCubit>().state.count);
        return context.read<CounterCubit>().increment(10);

    }, child: Text('Increment')),
    //BlocBuilder<CounterCubit, Counter>(
    //builder: (context, state) {
    //  return FutureBuilder<int>(
    //    future: state.fetchInt(),
    //    builder: (context,snapshot) {
    //      print(snapshot.connectionState);
    //      if ((snapshot.connectionState==ConnectionState.done)) {
    //        print(snapshot.connectionState);
    //        return Text(snapshot.data.toString());
    //
    //      } else {
    //        print(snapshot.connectionState);
    //        return CircularProgressIndicator();
    //      }
    //    }
    //  );

    //}),
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            //context.read<CounterCubit>.change(1);
            int i = context.watch<CounterCubit>().state.result;

            print('1');
            //int i=state.count;
            //int i=state;
            return Text('$i');
          },
        ),
      ],
    );
  }
}
