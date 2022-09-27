import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_generate/random_generate.dart';

import '../../bloc/generate_bloc.dart';

class ListServices extends StatefulWidget {
  const ListServices({Key? key}) : super(key: key);

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = Provider.simple().services.index;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.simple().countServices(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: currentIndex == index
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            selected: true,
            title: Text(Provider.simple().services.listServices[index].name),
            onTap: () {
              if (currentIndex != index) {
                BlocProvider.of<GenerateBloc>(context)
                    .add(const GenerateChanning());
                currentIndex = index;
                Provider.simple().services.index = index;

                setState(() {
                  print(Provider.simple().services.currentService().name);
                });
              }
              Navigator.of(context).pop();
            },
          );
        });
  }
}
