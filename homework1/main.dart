import 'package:test/test.dart';

import 'package:homework1/exercise1.dart';
import 'package:homework1/exercise2.dart' as Exercise2;
import 'package:homework1/exercise3.dart';
import 'package:homework1/exercise4.dart';
import 'package:homework1/exercise5.dart';
import 'package:homework1/exercise6.dart';
import 'package:homework1/exercise7.dart';
import 'package:homework1/exercise8.dart';
import 'package:homework1/exercise9.dart';



main() {
  //exercise2
  group('Упражнение 1', () {
    var zero=0;
    var n1024=1024;
    var b256=100000000;
    var notBin=123;
    test('Перевод десятичного числа '+ zero.toString()+ 'в двоичное ', () {
      expect(Exercise2.DecBin.dec2bin(zero), equals(0));
    });
    test('Перевод десятичного числа '+n1024.toString()+' в двоичное ', () {
      expect(Exercise2.DecBin.dec2bin(n1024), equals(10000000000));
    });
    test('Перевод десятичного числа '+(-1*n1024).toString()+' в двоичное ', () {
      expect(()=>Exercise2.DecBin.dec2bin(-1024), throwsA(TypeMatcher<ArgumentError>()));
    });
    test('Перевод двоичного числа '+zero.toString()+' в десятичное ', () {
      expect(Exercise2.DecBin.bin2dec(zero), equals(0));
    });
    test('Перевод двоичного числа '+b256.toString()+' в десятичное ', () {
      expect(Exercise2.DecBin.bin2dec(b256), equals(256));
    });
    test('Перевод двоичного числа '+notBin.toString()+' в десятичное ', () {
      expect(() => Exercise2.DecBin.bin2dec(notBin), throwsA(TypeMatcher<ArgumentError>()));
    });
  });
  //exercise3

}