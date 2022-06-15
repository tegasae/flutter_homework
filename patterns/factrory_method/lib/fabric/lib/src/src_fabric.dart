abstract class Ball {
  final int radius;

  Ball(this.radius);

  void render();
  int getRadius();
}

class VectorBall extends Ball {
  VectorBall(int radius) : super(radius);
  @override
  int getRadius() {
    return radius;
  }

  @override
  void render() {
    print('Rendering the vector ball with radius $radius');
  }
}

class PixelBall extends Ball {

  PixelBall(radius) : super(radius);

  @override
  int getRadius() {
    //get size and add 10
    return radius+10;
  }

  @override
  void render() {
    print('Rendering the pixel ball with radius $radius');
  }
}

class TextBall extends Ball {
  TextBall(int radius) : super(radius);

  @override
  int getRadius() {
    //add 100 to radius
    return radius+100;
  }

  @override
  void render() {
    print('Rendering the text ball with radius $radius');
  }

}