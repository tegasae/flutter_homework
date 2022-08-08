import 'dart:async';

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