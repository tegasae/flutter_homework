//import 'package:dart_eval/dart_eval.dart';



class Integral {
  static double trapezoid(double Function(double) f, double start, end, [e=0.001]) {
    double s0=1, s1=0;
    double x=start;
    double step=(end-start)*e;
    while ((s0-s1).abs()>e) {
      while (x < end) {
        x += step;
        s1 += ((f(x + step) + f(x)) / 2) * (step);
      }
      step/=2;
      s0=s1;
    }
    return s1;
  }

}

