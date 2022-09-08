import 'dart:async';


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


