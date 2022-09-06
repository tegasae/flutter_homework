import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/generate_bloc.dart';
import 'package:random_generate/random_generate.dart';

import 'data/random_int.dart';


void main() {
  ServiceProvider.instance.setup();
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
      create: (_)=>GenerateBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Random')),
        body: Column(
          children: const [
            RandomView(),
            Buttons(),
            Message()
          ],
        ),
        endDrawer: _EndDrawer(),
      ),
    );
  }
}



class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconsRun=Icons.play_arrow;
    print('1');
    return BlocBuilder<GenerateBloc,GenerateState>(
      buildWhen: (prev,state) =>prev.status != state.status,
      builder: (context, state) {
        print(state);

        return Column(children: [
        IconButton(onPressed: () {

          if (state.status==GenerateStatus.initial) {
            iconsRun=Icons.pause;
            context.read<GenerateBloc>().add(const GenerateStartedEvent());
          } else if (state.status==GenerateStatus.run) {

            iconsRun=Icons.play_arrow;
            context.read<GenerateBloc>().add(const GeneratePausedEvent());
          } else {
            iconsRun=Icons.pause;
            context.read<GenerateBloc>().add(const GenerateResumedEvent());
          }


          }, icon: Icon(iconsRun)),
        //ElevatedButton(onPressed: () =>context.read<GenerateBloc>().add(const GeneratePausedEvent()), child: const Text('Pause')),
        //ElevatedButton(onPressed: () =>context.read<GenerateBloc>().add(const GenerateResumedEvent()), child: const Text('Resume')),
        IconButton(onPressed: state.status!=GenerateStatus.run?null:() {context.read<GenerateBloc>().add(const GenerateStoppedEvent());},
        icon: const Icon(Icons.stop)),
        //ElevatedButton(onPressed: () =>context.read<GenerateBloc>().add(const GenerateStoppedEvent()), child: const Text('Stop'),)
      ],);}
    );
  }
}

class RandomView extends StatelessWidget {
  const RandomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('2');
    GenerateState state=context.select((GenerateBloc bloc) => bloc.state);

    if ((state.status==GenerateStatus.run)||(state.status==GenerateStatus.pause)) {
      final String value = state.value.getStr();
      return Text(value);
    } else {
      return Text('');
    }

  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('3');
    return Text('123');
  }
}

class _EndDrawer extends StatefulWidget {
  const _EndDrawer({Key? key}) : super(key: key);

  @override
  State<_EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<_EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerHeader(child: Text('Выберите нужный генератор')),
          Text('123'),
          ...SelectGenerator().getList()
        ],
      ),
    );
  }
}

class SelectGenerator {
  Map<String,String> nameItem={'value1':'item1','value2':'item2'};
  String? defaultValue='value1';
  List<Widget> getList() {
    List<Widget> widgets=[];
    nameItem.forEach((key, value) {widgets.add(listItem(key));});
    return widgets;
  }
  Widget listItem(String key) {
    return ListTile(
      title:Text(nameItem[key]!),
      leading: Radio<String>(
        groupValue: defaultValue,
        value: key,
        onChanged: (String? value) {defaultValue=key;print("$key $defaultValue");setState() {}},
      ),
    );
  }
}