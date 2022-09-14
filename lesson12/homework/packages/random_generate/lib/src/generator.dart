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
  late Stream<ContainerData> stream;

  Generate(this.name) {
    //stream=Stream.periodic(const Duration(seconds: 1), (x) =>value());
    //    .takeWhile((element) => flag);

  }

  ContainerData value();


  Stream<ContainerData> get() {
    //return stream;
    return Stream.periodic(const Duration(seconds: 1), (x) =>value())
        .takeWhile((element) => flag);
    //return stream.takeWhile((element) => flag);
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


