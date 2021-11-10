//import 'package:dart_eval/dart_eval.dart';

class ValueNotDefinedException implements Exception {
  String _message;
  ValueNotDefinedException(this._message);

  @override
  String toString() {
    return _message;
  }
}

class Integral {
  late double Function(double) f;


  Integral(this.f);
  double trapezoid(double start, end, [e=0.001]) {
    double s0=0, s1=0;
    double x=start;
    double step=(end-start)*e;

    while (true) {

      x=start;
      while (x < end) {
        s1 += ((f(x+step) + f(x)) / 2) * (step);
        if ((s1==double.infinity) || (s1==-double.infinity)|| (s1==double.nan)) {
          throw new ValueNotDefinedException('Значение фунции не определено для $x');
        }
        x+=step;
      }

      if ((s1-s0).abs()<=e) {
        break;
      }
      step/=2;
      s0=s1;
      s1=0;
    }
    return s1;
  }
}

