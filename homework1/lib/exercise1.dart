import 'dart:math';

class Calculate {
  int number=0;

  Calculate(this.number);

  int gcd(int secondNumber) {
    int max=this.number;
    int min=secondNumber;
    int result;
    int swap;
    while (true) {
      if (max < min) {
        swap = min;
        min = max;
        max = swap;
      }
      result = max % min;
      if (result == 0) {
        return min;
      } else {
        max = result;
      }
    }
  }
  int lcm(int secondNumber) {
    return ((this.number*secondNumber).abs()/this.gcd(secondNumber)).toInt();
  }

  bool _perfectSquare(int x) {
    int n=sqrt(x).toInt();
    return n*n==x;
  }
  int _factorizeFerma(int n) {
    int x = sqrt(n).toInt()+1;

    while (! _perfectSquare((x*x)-n)) {
      x+=1;
      print(x);
    }
    int y=sqrt(x*x-n).toInt();
    int d1=x-y;
    int d2=x+x;
    return d1;
}
  int findSimple() {
    int n=_factorizeFerma(this.number);
    print(n);
    //if ( (n!=1) || (n % 2)==0 || (_factorizeFerma(n)!=1)) {
    //  return n=0;
    //}
    return n;
  }
}


