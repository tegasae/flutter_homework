import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generators/generators.dart';

import 'package:homework/bloc/generate_bloc.dart';

class ListServices extends StatefulWidget {
  const ListServices({Key? key}) : super(key: key);

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  late int _currentIndex;
  late Services _services;
  late Generate generate;

  @override
  void initState() {
    super.initState();
    _services = Provider.simple().serviceProvider.get<Services>();
    generate = Provider.simple().serviceProvider.get<Generate>();
    _currentIndex = _services.index;
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: _services.getLength(),
      itemBuilder: (context, index) => ListTile(
            leading: _currentIndex == index
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            selected: true,
            title: Text(generate.name),
            onTap: () {
              if (_currentIndex != index) {
                BlocProvider.of<GenerateBloc>(context)
                    .add(const GenerateChanning());
                _currentIndex = index;

                _services.index = index;

                Provider.simple()
                    .serviceProvider
                    .setup<Generate>(_services.currentService());

              }
              Navigator.of(context).pop();
            },
          ),);

}
