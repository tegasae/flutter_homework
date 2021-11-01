double _power(double n,int power) {
  double result=1;
  while (power-->0) {
    result*=n;
  }

  return result;
}

extension nthRoot on num {
  double calculateRoot(int s,[double precision=0.1]) {
    double x0 = 0;
    double x1 = 1;

    double p = 1;

    int i = 0;
    while ((x1 - x0).abs() > precision) {
      x0 = x1;

      x1=((s-1)*x0+(this/_power(x0,s-1)))/s;


      if (x1==double.infinity) {
        print('11111');
        throw ArgumentError('1111');
      }

      print(x1);

    }
    return (x1*(1/precision)+0.5*precision).round()*precision;
  }
}