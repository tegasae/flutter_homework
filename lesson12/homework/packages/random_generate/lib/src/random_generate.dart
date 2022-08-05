import 'dart:async';
import 'dart:math';

import 'package:random_generate/src/generator.dart';

class RandomGenerate implements Generator {
  final StreamController<int> _controller=StreamController<int>();

  Stream<int> value() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }


  Future<void> generate() async {
    await Future<void>.delayed(const Duration(seconds:1),()=>_controller.add(Random().nextInt(100)));
  }

  void dispose() {
    _controller.close();
  }
}