import 'dart:async';

abstract class Generator<T> {
  final StreamController<T> controller=StreamController<T>();
  Stream<T> value() async* {

  }

  Future<void> generate();
  void dispose();
}