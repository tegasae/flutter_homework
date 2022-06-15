class Ball {
  final int color;
  Ball(this.color);
}

enum State { empty, fill, active }

class Box {
  Ball ?ball;
  Box({required Ball ?this.ball});

  bool isEmpty() {
    return ball==null;
  }
}


class Board{
  int width;
  int height;
  List<Box> boxes=[];


  int lenBoard=0;
  Board(this.width, this.height) {
    lenBoard=width*height;
    for (int i=0;i<width*height-1;i++) {
      boxes[i]=Box(ball: null);
    }
  }

  int toLine(int x,int y) {
    if ((x>=width) || (y>=height)) {
      throw  WidthOrHeightException("x or y more than width or height");
    }
    return y*(width-1)+x;
  }

  Box getBox(int x, int y) {
    return boxes[toLine(x, y)];
  }

  void setBox(int x,int y,Box box) {
    boxes[toLine(x, y)]=box;
  }

}


class WidthOrHeightException implements Exception {
  String cause;
  WidthOrHeightException(this.cause);
}