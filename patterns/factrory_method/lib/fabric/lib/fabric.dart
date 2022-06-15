library fabric;
import 'src/src_fabric.dart';



abstract class CreateBall {
  final int positionX;
  final int positionY;
  final int radius;
  CreateBall(this.positionX, this.positionY, this.radius);

  void calculatePosition() {
    print('Position positionX*positionY ${positionX*positionY}');
  }

  void render() {
    Ball ball=create(radius);
    print('Render start');
    ball.render();
    print(ball.getRadius());
    print('Render finish');
  }
  Ball create(int radius);
}

class VectorCreateBall extends CreateBall {
  VectorCreateBall(int positionX, int positionY, int radius) : super(positionX, positionY,radius);

  @override
  Ball create(int radius) {
    return VectorBall(radius);
  }
}

class PixelCreateBall extends CreateBall {
  PixelCreateBall(int positionX, int positionY, int radius) : super(positionX, positionY, radius);

  @override
  Ball create(int radius) {
    return PixelBall(radius);
  }
}

class TextCreateBall extends CreateBall {
  TextCreateBall(int positionX, int positionY, int radius) : super(positionX, positionY, radius);

  @override
  Ball create(int radius) {
    return TextBall(radius);
  }

}

