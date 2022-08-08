import 'dart:async';
import 'dart:math';

import 'package:random_generate/src/generator.dart';

class RandomGenerate extends Generator<int> {


  Stream<int> value() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* controller.stream;
  }


  Future<void> generate() async {
    await Future<void>.delayed(const Duration(seconds:1),()=>controller.add(Random().nextInt(100)));
  }

  void dispose() {
    controller.close();
  }
}