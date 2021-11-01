//Упражнение 6
//Реализуйте класс Point, который описывает точку в трёхмерном пространстве.
//У данного класса реализуйте метод distanceTo(Point another), который
//возвращает расстояние от данной точки до точки в параметре. По желанию
//можете реализовать метод, принимающий три точки в трёхмерном пространстве и
//возвращающий площадь треугольника, который образуют данные точки.\
//Реализуйте factory-конструкторы для данного класса, возвращающие начало
//координат, и ещё несколько на своё усмотрение (например, конструктор,
//возвращающий точку с координатами [1,1,1],
//которая определяет единичный вектор).

import 'dart:math';

class Point {
  double x=0;
  double y=0;
  double z=0;

  Point(this.x,this.y,this.z);

  factory Point.zero() {
    return Point(0,0,0);
  }
  factory Point.one() {
    return Point(1,1,1);
  }

  @override
  operator ==(point) => this.x == (point as Point).x && this.y==point.y && this.z==point.z;
  @override
  operator -(Point point) => distanceTo(point);

  @override
  String toString() {
    return '['+x.toString()+', '+y.toString()+', '+z.toString()+']';
  }

  double distanceTo(Point point) {
    //euclidean distance
    if (this==point) {
      return 0;
    }
    return sqrt((this.x-point.x)*(this.x-point.x)+
                (this.y-point.y)*(this.y-point.y)+
                (this.z-point.z)*(this.z-point.z));
  }
}


