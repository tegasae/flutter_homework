import 'dart:math';

import 'package:factory_method/fabric/lib/fabric.dart';


main() {
  CreateBall createBall;
  int intValue = Random().nextInt(100);
  print(intValue);
  if (intValue>=50) {
    createBall=VectorCreateBall(10,10,11);
  } else {
    if (intValue>70) {
      createBall = PixelCreateBall(10, 10, 11);
    } else {
      createBall=TextCreateBall(10,10,11);
    }
  }
  createBall.calculatePosition();
  createBall.render();
}