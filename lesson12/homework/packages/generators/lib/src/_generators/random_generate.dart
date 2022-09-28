import 'dart:math';

import 'package:models/models.dart';

import '../../generators.dart';


class RandomGenerate extends Generate {
  Random random = Random();

  RandomGenerate(super.name);

  @override
  void init() {
    super.init();
    random = Random();
  }

  @override
  ContainerData value() {
    return ContainerData(value: random.nextInt(100));
  }
}
