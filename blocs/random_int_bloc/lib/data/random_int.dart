import 'dart:async';
import 'dart:math';

class RandomStream {
  Random random=Random();
  bool flag=true;
  RandomStream();
  Stream<int> rand() {
    return Stream.periodic(const Duration(seconds: 1), (x) => random.nextInt(100))
        .takeWhile((element) => flag);
  }
}

