import 'dart:math';

class Point {
  double x=0;
  double y=0;
  double z=0;
  Point(this.x,this.y,this.z);
  factory Point.zero() {
    return Point(0,0,0);
  }
  factory Point.unit() {
    return Point(1,1,1);
  }

  @override
  operator ==(point) => this.x == (point as Point).x && this.y==point.y && this.z==point.z;
  operator -(Point point) => distanceTo(point);

  double distanceTo(Point point) {
    if (this==point) {
      return 0;
    }
    return sqrt((this.x-point.x)*(this.x-point.x)+
                (this.y-point.y)*(this.y-point.y)+
                (this.z-point.z)*(this.z-point.z));
  }
}


