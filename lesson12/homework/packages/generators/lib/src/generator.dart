import 'dart:async';

import 'package:models/models.dart';

class Services {
  List<Generate> listServices = [];
  int index = 0;

  Services({this.listServices = const []});

  List<String> getNames() {
    List<String> names = [];
    for (var element in listServices) {
      names.add(element.name);
    }

    return names;
  }

  int getLength() {
    return listServices.length;
  }

  Generate currentService() {
    return listServices[index];
  }
}

abstract class Generate {
  final String name;
  late StreamController<ContainerData> controller;
  Timer? timer;

  final int interval = 1;
  bool flag = true;

  Generate(this.name);

  Future<void> startGenerator() async {
    init();

    flag = true;
    timer = Timer.periodic(Duration(seconds: interval), tick);
  }

  void tick(Timer _) {
    if (!flag) {
      controller.close();
      timer?.cancel();
    }
    if (!controller.isClosed) {
      controller.add(value()); // Ask stream to send counter values as event.
    }
  }

  void pauseGenerator() {
    timer?.cancel();
    flag = false;
  }

  void resumeGenerator() {
    timer = Timer.periodic(Duration(seconds: interval), tick);
    flag = true;
  }

  void stopGenerator() {
    dispose();
    flag = false;
    timer?.cancel();
    controller.close();
  }

  void init() {}

  void dispose() {}

  ContainerData value();

  Stream<ContainerData> getController() {
    controller = StreamController<ContainerData>(
      onListen: startGenerator,
      onPause: pauseGenerator,
      onResume: resumeGenerator,
      onCancel: stopGenerator,
    );

    return controller.stream;
  }
}

abstract class Generator {
  final StreamController<int> controller = StreamController<int>();

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
