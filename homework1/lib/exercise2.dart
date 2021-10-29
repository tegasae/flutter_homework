//упражнение 2
//Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.

class DecBin {
  //перевод из дестичной в двоичную
  static int dec2bin(int number) {

    int result = 0;
    int p = 1;

    if (number<0) {
      //только больше нуля
      //инвертировать и прибавлять единицу
      throw ArgumentError('Only great or equal at 0');
    }
    while (number > 0) {
      result = result + (number % 2) * p;
      number = (number / 2).floor();
      p *= 10;
    }

    return result;
  }
  //перевод из двоичной в десятичную
  //интересно было попробовать средствами языка
  static int bin2dec(int number) {
    //print(55.toRadixString(2)); // Outputs 110111
    //print(int.parse("110111", radix: 2)); //Outputs 55
    //print(num.toRadixString(10));
    try {
      return int.parse(number.toString(), radix: 2);
    } on FormatException catch(e) {
      throw ArgumentError('Only 0 or 1');
    }
  }
}