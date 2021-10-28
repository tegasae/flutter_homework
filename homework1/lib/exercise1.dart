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

}
main1() {
  print("Hello1");
}


int gcd(int num1, num2) {
  int max=num1;
  int min=num2;
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

int lcm(int n1,int n2) {
  return ((n1*n2).abs()/gcd(n1,n2)).toInt();
}

int f(int x) {
  return (x+1)*(x+1);
}
int findDivisor(int n1, [int seed=1]) {
  int x=seed;
  int y=seed;
  int divisor=1;
  while (divisor==1||divisor==n1) {

    y=f(y) % n1;
    x=f(f(x) % n1) % n1;
    divisor=gcd((x-y).abs(), n1);
  }
  return divisor;
}