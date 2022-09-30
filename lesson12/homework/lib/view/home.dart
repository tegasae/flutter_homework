import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/bloc/generate_bloc.dart';
import 'package:homework/view/visual/end_drawer.dart';
import 'package:homework/view/visual/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => GenerateBloc(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Генерация чисел')),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                  child: NameGenerator(),
                ),
                const RandomView(),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: const Buttons(),
                  ),
                ),
              ],
            ),
          ),
          endDrawer: const EndDrawer(),
        ),
      );
}
