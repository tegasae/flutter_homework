class Point {
  int x=0;
  int y=0;

  Point(int x, int y) {
    this.x=x+10;
    this.y=y+10;
  }

  Point.abs(int x, int y) {
    this.x=x*x;
    this.y=y*y;
  }

  int getXY() {
    return x*y;
  }
}

class Point3 extends Point {
  int z=0;

  Point3(int x, int y, int z) : super(x, y) {

    this.z=z;
  }
}

int getParameters(int x,{String name='n',required String str}) {
  print(x);
  print(name);
  print(str);
  return 0;
}

int getPositionParameters(int x, [name='n']) {
  print(x);
  print(name);
  return 0;
}


main() {
  Point p1=Point(1,2);
  Point p2=Point.abs(1, 2);
  Point3 p3=Point3(1,2,3);
  print("p1=${p1.getXY()}");
  print("p2=${p2.getXY()}");
  print("p3 ${p3.x}");
  print('----');
  getParameters(11,str:'s');
  getParameters(10,name: 'nn',str:'s1');
  getPositionParameters(10,'nn');
}