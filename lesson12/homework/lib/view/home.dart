import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/generate_bloc.dart';
import 'visual/end_drawer.dart';
import 'visual/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => GenerateBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Генерация чисел')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: const [
              NameGenerator(),
              Expanded(child: RandomView()),
              Center(child: Buttons()),
              //Message()
            ],
          ),
        ),
        endDrawer: const EndDrawer(),
      ),
    );
  }
}

