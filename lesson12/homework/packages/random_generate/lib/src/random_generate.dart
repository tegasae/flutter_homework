import 'dart:async';
import 'dart:math';

import 'package:random_generate/src/generator.dart';

class RandomGenerate extends Generate {
  Random random=Random();

  RandomGenerate(super.name);
  @override
  ContainerData value() {
    return ContainerData(random.nextInt(100));
  }
}

