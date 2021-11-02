import 'dart:math';

import 'package:test/test.dart';

import 'package:homework1/exercise1.dart' as Exercise1;
import 'package:homework1/exercise2.dart' as Exercise2;
import 'package:homework1/exercise3.dart' as Exercise3;
import 'package:homework1/exercise4.dart' as Exercise4;
import 'package:homework1/exercise5.dart' as Exercise5;
import 'package:homework1/exercise6.dart' as Exercise6;
import 'package:homework1/exercise7.dart' as Exercise7;
import 'package:homework1/exercise8.dart' as Exercise8;
import 'package:homework1/exercise9.dart' as Exercise9;



main() {
  //exercise1
  group('Упражнение 1 ', () {
    int number=105;
    int number1=60;
    int zero=0;
    var calculate=Exercise1.Calculate(number);
    int gcd=calculate.gcd(number1);
    int lcm=calculate.lcm(number1);

    List<int> simpleNumber=calculate.factorizeTrivial();
    test('Наибольший общий делитель для  $number и $number1 равен $gcd', () {
      expect(gcd, equals(15));
    });
    test('Наименьшее общее кратное для  $number и $number1 равен $lcm', () {
      expect(lcm, equals(420));
    });
    test('Простые множители для  $number $simpleNumber', () {
      expect(simpleNumber, equals([3,5,7]));
    });
    test('Исключение что аргумент неверный при $zero', () {
      expect(()=>Exercise1.Calculate(zero), equals(throwsA(TypeMatcher<ArgumentError>())));
    });

  });


  //exercise2
  group('Упражнение 2', () {
    var zero=0;
    var d256=256;
    var b256=100000000;
    var notBin=123;
    test('Перевод десятичного числа $d256 в двоичное $b256', () {
      expect(Exercise2.DecBin.dec2bin(d256), equals(b256));
    });

    test('Перевод двоичного числа $b256 в десятичное $d256', () {
      expect(Exercise2.DecBin.bin2dec(b256), equals(d256));
    });
    test('Перевод отрицательного десятичного числа -$d256 в двоичное ', () {
      expect(()=>Exercise2.DecBin.dec2bin(-1*d256), throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Перевод двоичного числа, которое содержит не только 0 или 1 $notBin в десятичное', () {
      expect(() => Exercise2.DecBin.bin2dec(notBin), throwsA(TypeMatcher<ArgumentError>()));
    });
  });


  //exercise3
  group('Упражнение 3 ', () {
    var str1='str1 123 text 456 end of str';
    var str2='1 str2 123 text 456 end of str';
    var str3='str3 12.3 text 45.6 end of str';
    var str4='str4 -123 text +45.6 end of str';
    var str5='str5';
    var str6='';

    test('Поиск чисел в строке '+ str1, (){
      expect(Exercise3.NumbersCollection.getNumbers(str1),equals([123,456]));
    });

    test('Поиск чисел в строке '+ str2 + ' с первым символом числом', (){
      expect(Exercise3.NumbersCollection.getNumbers(str2),equals([1, 123,456]));
    });

    test('Поиск чисел в строке '+ str3 + ' с дробными числами', (){
      expect(Exercise3.NumbersCollection.getNumbers(str3),equals([12.3,45.6]));
    });
    test('Поиск чисел в строке '+ str4 + ' с положительными и отриацательными числами', (){
      expect(Exercise3.NumbersCollection.getNumbers(str4),equals([-123,45.6]));
    });
    test('Поиск чисел в строке '+ str5 + ' без чисел', (){
      expect(Exercise3.NumbersCollection.getNumbers(str5),equals([]));
    });
    test('Поиск чисел в строке '+ str6 + ', которая пустая', (){
      expect(Exercise3.NumbersCollection.getNumbers(str6),equals([]));
    });


  });

  //exercise4
  group('Упражнение 4, подсчет количества слов', () {
    List<String> list1=['word1','word2','word3'];
    List<String> list2=['word1','word2','word3','word1','word2'];;
    List<String> list3=[];


    test('Подсчет слов в коллекции '+ list1.toString(), (){
      expect(Exercise4.CounterWords.counter(list1),equals({'word1': 1, 'word2': 1, 'word3': 1}));
    });
    test('Подсчет слов в коллекции '+ list2.toString(), (){
      expect(Exercise4.CounterWords.counter(list2),equals({'word1': 2, 'word2': 2, 'word3': 1}));
    });
    test('Подсчет слов в пустой коллекции '+ list3.toString(), (){
      expect(Exercise4.CounterWords.counter(list3),equals({}));
    });

  });

  //exercise5
  group('Упражнение 5, подсчет количества цифр', ()
  {
    List<String> listOfWords1 = ['one, two, zero, zero'];
    List<String> listOfWords2 = ['one, two, zero, word1,zero','word1, word2, word3','one, word1'];


    test('Подсчет цифр в коллекции ' + listOfWords1.toString(), () {
      expect(Exercise5.CounterNumbers.counterNumbers(listOfWords1), equals([[1, 2, 0]]));
    });
    test('Подсчет цифр в коллекции ' + listOfWords2.toString(), () {
      expect(Exercise5.CounterNumbers.counterNumbers(listOfWords2), equals([[1, 2, 0],[],[1]]));
    });

  });

  //exercise6
  group('Упражнение 6, расчет расстояний между точками', ()
  {
    var p0 = Exercise6.Point.zero();
    var p1 = Exercise6.Point.one();
    var p  = Exercise6.Point(1.5,2.5,3.5);

    var pEqual=Exercise6.Point(1.5,2.5,3.5);

    test('Расстояние между точками ' + p0.toString() +' и '+p1.toString(), () {
      expect(p0.distanceTo(p1), equals(1.7320508075688772));
    });

    test('Расстояние между точками ' + p0.toString() +' и '+p.toString(), () {
      expect(p0.distanceTo(p), equals(4.55521678957215));
    });

    test('Расстояние между точками ' + p0.toString() +' и '+p.toString(), () {
      expect(p0.distanceTo(p), equals(4.55521678957215));
    });
    test('Расстояние между точками ' + p.toString() +' и '+pEqual.toString(), () {
      expect(p.distanceTo(pEqual), equals(0));
    });

    test('Расстояние между точками ' + p0.toString() +' и '+p1.toString() + ' при помощи перезагрузки оператора', () {
      expect(p0-p1, equals(1.7320508075688772));
    });
  });

  //exercise7
  group('Упражнение 7, вычисление корня любой степени из числа', ()
  {
    num n1 = 4.0;
    num n2 = -4.0;
    var root2 = 2;
    var root3 = 3;


    test('Корень ', () {
      expect(Exercise7.nthRoot(n1).calculateRoot(root2), equals(2.0));
    });

    test('Корень ', () {
      expect(Exercise7.nthRoot(n2).calculateRoot(0), equals(2.0));
    });

    test('Корень ', () {
      expect(Exercise7.nthRoot(n1).calculateRoot(0), equals(2.0));
    });
  });

  //exercise9
  group('Упражнение 9, вычисление интеграла', ()
  {
    double f(double x) {
      return 1 / x;
    }
    double e=0.001;
    var sinx = Exercise9.Integral(sin).trapezoid(0, pi,e=0.001);


  });

*/


}

