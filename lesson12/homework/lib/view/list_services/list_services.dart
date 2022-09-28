import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generators/generators.dart';

import '../../bloc/generate_bloc.dart';

class ListServices extends StatefulWidget {
  const ListServices({Key? key}) : super(key: key);

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  late int currentIndex;
  late Services services;
  late Generate generate;
  @override
  void initState() {
    super.initState();
    services=Provider.simple().serviceProvider.get<Services>();
    generate=Provider.simple().serviceProvider.get<Generate>();
    currentIndex = services.index;

  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: services.getLength(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: currentIndex == index
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            selected: true,
            title: Text(generate.name),

            onTap: () {
              if (currentIndex != index) {
                BlocProvider.of<GenerateBloc>(context)
                    .add(const GenerateChanning());
                currentIndex = index;

                services.index=index;

                Provider.simple().serviceProvider.setup<Generate>(services.currentService());
                setState(() {

                  print(generate.name);
                });
              }
              Navigator.of(context).pop();
            },
          );
        });
  }
}
