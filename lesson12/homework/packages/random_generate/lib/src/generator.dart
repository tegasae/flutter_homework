import 'dart:async';

import 'package:random_generate/random_generate.dart';


class ContainerData {
  final int value;

  const ContainerData(this.value);
  static const empty=ContainerData(0);

  String getStr() {
    return value.toString();
  }
}

abstract class Generate {
  bool flag=true;
  final String name;

  Generate(this.name);

  ContainerData value();

  Stream<ContainerData> get() {
    return Stream.periodic(const Duration(seconds: 1), (x) =>value())
        .takeWhile((element) => flag);
  }
  //Stream<ContainerData> get() async* {
  //  while(flag) {
  //    yield value();
  //  }
  //}
}




abstract class Generator {
  final StreamController<int> controller=StreamController<int>();





  Stream<int> value() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    generate();
    yield* controller.stream;
  }


  Future<void> generate();
  void dispose() {
    controller.close();
  }
}


