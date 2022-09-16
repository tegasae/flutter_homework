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
  final String name;
  late StreamController<ContainerData> controller;
  Timer? timer;


  final int interval=1;
  bool flag=true;

  Generate(this.name) {


  }


  Future<void> startGenerator() async {
    init();


      flag=true;
      timer = Timer.periodic(Duration(seconds: interval), tick);



  }

  void tick(_) {
    if (flag==false) {
      controller.close();
      timer?.cancel();
    }
    if (!controller.isClosed) {
      controller.add(value()); // Ask stream to send counter values as event.
    }

  }

  void pauseGenerator() {
    print('pause');
    timer?.cancel();
    flag=false;
  }

  void resumeGenerator() {
    print('resume');
    timer = Timer.periodic(Duration(seconds: interval), tick);
    flag=true;
  }
  void stopGenerator() {
    dispose();
    flag=false;
    timer?.cancel();
    controller.close();
  }

  void init() {}
  void dispose() {}
  ContainerData value();


  Stream<ContainerData> getController() {
    //flag=true;
    controller = StreamController<ContainerData>(
        onListen: startGenerator,
        onPause: pauseGenerator,
        onResume: resumeGenerator,
        onCancel: stopGenerator);
    return controller.stream;
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


