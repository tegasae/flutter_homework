//Упражнение 7
//Реализуйте метод, который вычисляет корень любой заданной степени из числа.
//Реализуйте данный метод как extension-метод для num.
//Алгоритм можете взять на википедии как «Алгоритм нахождения корня n-й степени».
//Запрещается использовать методы math. В случае когда значение вернуть
//невозможно, необходимо бросать исключение с описанием ошибки.

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

    if (s==0) {
      return 1.0;
    }
    if ((s % 2==0) && this<0) {
      throw ArgumentError('Невозможно извлечь действительный корень степени $s из $this');
    }
    int i = 0;
    while ((x1 - x0).abs() > precision) {
      x0 = x1;

      x1=((s-1)*x0+(this/_power(x0,s-1)))/s;
      if (x1==double.infinity) {
        throw ArgumentError('Невозможно извлечь корень степени $s из $this');
      }
    }
    return (x1*(1/precision)+0.5*precision).round()*precision;
  }
}