import 'dart:math';

class Calculate {
  late final int _number;
  List<int> _simpleNumbers=[];

  Calculate(int number) {
    if (number<=0) {
      throw new ArgumentError('Only greater than 0');
    }
    this._number=number;
  }

  int gcd(int secondNumber) {
    int max=this._number;
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
    return ((this._number*secondNumber).abs()/this.gcd(secondNumber)).toInt();
  }

  List<int> factorizeTrivial() {
    int n=this._number;
    int divisor = 2;
    while (divisor * divisor <= n) {
      if (n % divisor == 0) {
        n = n ~/ divisor;
        _simpleNumbers.add(divisor);
      }
      else {
        divisor += 1;
      }
    }
    if (n != 1) {
      _simpleNumbers.add(n);
    }
    return _simpleNumbers;
  }

  //bool _perfectSquare(int x) {
  //  int n=sqrt(x).toInt();
  //  return n*n==x;
  //}
  /*int factorizeFerma(int n) {
    if ((n==1) || (n==2)) {
      return n;
    }
    int x = sqrt(n).toInt()+1;
    while (! _perfectSquare((x*x)-n)) {
      x+=1;
      print(x);
    }
    int y=sqrt(x*x-n).toInt();
    int d1=x-y;
    int d2=x+x;

    if (d1>2) {
      int nn=factorizeFerma(d1);
      simpleNumbers.add(nn);
    }

    return d2;

}
*/
 /*
  int factorizeFerma(int n) {

    int x = sqrt(n).toInt();
    int y=0;
    int r=x*x-y*y-n;
    for (;;) {
      //print(r);
      if (r==0) {
        return x!=y ? x-y : x+y;
      } else {
          if (r>0) {
            r-=y+y+1;
            y++;
          } else {
            r+=x+x+1;
            ++x;
          }
      }
    }

  }
  int factorize(int n) {

    int n1=n;
    int nPrev=n1;
    if (n==2) {
      print(n);
      return n;
    }
    while (true) {
      nPrev=n1;
      n1=factorizeFerma(n1);
      print(n1);
      if (n1==1) {
        break;
      }


    }
    print(nPrev);
    //print(n1);
    //print(n~/n1);
    return 0;
  }

  */

}



