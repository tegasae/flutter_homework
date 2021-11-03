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
    const number=105;
    const number1=60;
    const zero=0;
    final calculate=Exercise1.Calculate(number);
    final int gcd=calculate.gcd(number1);
    final int lcm=calculate.lcm(number1);

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
    const d256=256;
    const b256=100000000;
    const notBin=123;
    test('Перевод десятичного числа $d256 в двоичное $b256', () {
      expect(Exercise2.DecBin.dec2bin(d256), equals(b256));
    });

    test('Перевод двоичного числа $b256 в десятичное $d256', () {
      expect(Exercise2.DecBin.bin2dec(b256), equals(d256));
    });
    test('Перевод отрицательного десятичного числа -$d256 в двоичное ', () {
      expect(()=>Exercise2.DecBin.dec2bin(-1*d256), throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Перевод двоичного числа, которое содержит не только 0 или 1 $notBin в десятичное, получаем исключение', () {
      expect(() => Exercise2.DecBin.bin2dec(notBin), throwsA(TypeMatcher<ArgumentError>()));
    });
  });


  //exercise3
  group('Упражнение 3 ', () {
    const str1='1 str1 123 text 456 text -12.3 456 end of str';
    const str2='str1';

    const n1=[1, 123, 456, -12.3, 456];
    const n2=[];
    test('Поиск чисел в строке $str1, должно быть $n1', (){
      expect(Exercise3.NumbersCollection.getNumbers(str1),equals(n1));
    });

    test('Поиск чисел в строке str2, должно быть $n2', (){
      expect(Exercise3.NumbersCollection.getNumbers(str2),equals(n2));
    });
  });



  //exercise4
  group('Упражнение 4', () {
    const List<String> list1=['word1','word2','word3','word1','word4'];
    const Map<String,int> count1={'word1': 2, 'word2': 1, 'word3': 1,'word4':1};
    test('Подсчет слов в коллекции $list1, должно быть $count1', (){
      expect(Exercise4.CounterWords.counter(list1),equals(count1));
    });
   });

  //exercise5

  group('Упражнение 5', ()
  {
    final List<String> listOfWords1 = ['one, two, zero, word1, zero','word1, word2, word3','one, word1'];

    const lists1=[[1,2,0],[],[1]];
    test('Подсчет цифр в коллекции $listOfWords1, должно быть $lists1', () {
      expect(Exercise5.CounterNumbers.counterNumbers(listOfWords1), equals(lists1));
    });

  });

  //exercise6
  group('Упражнение 6, расчет расстояний между точками', ()
  {
    final p0 = Exercise6.Point.zero();
    final p1 = Exercise6.Point.one();
    final pn  = Exercise6.Point(1,1,2);

    final pEqual=Exercise6.Point(1,1,2);

    const distance01=1.7320508075688772;
    const distance0n=1;
    const distanceZero=0;

    test('Расстояние между точками $p0 $p1 равно $distance01', () {
      expect(p0.distanceTo(p1), equals(distance01));
    });

    test('Расстояние между точками $p1 и $pn равно $distance0n', () {
      expect(p0.distanceTo(pn), equals(distance0n));
    });


    test('Расстояние между точками $pn и $pEqual равно distanceZero', () {
      expect(pn.distanceTo(pEqual), equals(distanceZero));
    });

    test('Расстояние между точками $p0 $p1 используя перегруженный оператор "-" равно $distance01', () {
      expect(p0-p1, equals(distance01));
    });
  });
/*
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

