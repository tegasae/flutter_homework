import 'dart:async';
import 'dart:math';

import 'package:models/models.dart';
import 'package:random_generate/src/generator.dart';

class RandomGenerate extends Generate {
  Random random=Random();

  RandomGenerate(super.name);
  @override
  void init() {
    super.init();
    random=Random();
  }

  @override
  ContainerData value() {
    return ContainerData(random.nextInt(100));
  }
}

