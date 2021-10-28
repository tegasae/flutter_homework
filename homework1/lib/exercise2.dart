class DecBin {

  static int dec2bin(int number) {
    int result = 0;
    int p = 1;
    while (number > 0) {
      result = result + (number % 2) * p;
      number = (number / 2).floor();
      p *= 10;
    }
    return result;
  }

  static int bin2dec(int number) {
    //print(55.toRadixString(2)); // Outputs 110111
    //print(int.parse("110111", radix: 2)); //Outputs 55
    //print(num.toRadixString(10));
    return int.parse(number.toString(), radix: 2);
  }
}