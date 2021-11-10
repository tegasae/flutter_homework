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
    test('Поиск чисел в строке "$str1", должно быть $n1', (){
      expect(Exercise3.NumbersCollection.getNumbers(str1),equals(n1));
    });

    test('Поиск чисел в строке "str2", должно быть $n2', (){
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

    final pEqual=Exercise6.Point(1,1,2.0);

    const distance01=1.7320508075688772;

    const distance1n=1;
    const distanceZero=0;

    test('Расстояние между точками $p0 $p1 равно $distance01', () {
      expect(p0.distanceTo(p1), equals(distance01));
    });
    test('Расстояние между точками $p1 и $pn равно $distance1n', () {
      expect(p1.distanceTo(pn), equals(distance1n));
    });
    test('Расстояние между точками $pn и $pEqual равно $distanceZero', () {
      expect(pn.distanceTo(pEqual), equals(distanceZero));
    });
    test('Расстояние между точками $p0 $p1 используя перегруженный оператор "-" равно $distance01', () {
      expect(p0-p1, equals(distance01));
    });
  });



  //exercise7
  group('Упражнение 7 ', ()
  {
    const n4 = 4.0;
    const n4Negative = -4.0;
    const n8=8;

    const root2 = 2;
    const root3 = 3;

    const result4=2;
    const result8=2;

    test('Из $n4 извлекаем корень $root2 равно $result4', () {
      expect(Exercise7.nthRoot(n4).calculateRoot(root2), equals(result4));
    });

    test('Из $n8 извлекаем корень $root3 равно $result8', () {
      expect(Exercise7.nthRoot(n8).calculateRoot(root3), equals(result8));
    });

    test('Из $n4Negative извлекаем корень $root2, получаем исключение', () {
      expect(() => Exercise7.nthRoot(n4Negative).calculateRoot(root2), throwsA(TypeMatcher<ArgumentError>()));
    });


  });

  //exercise8
  group('Упражнение 8', ()
  {

    var adminUser=Exercise8.AdminUser('admin@admin.ru');
    var generalUser1=Exercise8.GeneralUser('user1@user.ru');
    var generalUser2=Exercise8.GeneralUser('user2@user.ru');
    var userManager=Exercise8.UserManager<Exercise8.User>();

    userManager.addUser(adminUser);
    userManager.addUser(generalUser1);
    userManager.addUser(generalUser2);

    const list1=['admin.ru','user1@user.ru','user2@user.ru'];
    const list2=['admin.ru','user2@user.ru'];

    final result1=userManager.getEmails();
    userManager.delUser(generalUser1);
    final result2=userManager.getEmails();

    test('Список $result1 равен $list1', () {
      expect(result1, equals(list1));
    });

    test('Список $result2 после удаления пользователя равен $list2', () {
      expect(result2, equals(list2));
    });


  });

  //exercise9
  group('Упражнение 9', ()
  {
    const fSin=sin;
    const fLn=log;

    const x0=0.0;
    const xPi=pi;
    const x1=1.0;

    const sinResult=2.0;

    var e=0.001;

    test('Интеграл для $fSin на [$x0, $xPi] равен $sinResult-$e $sinResult+$e', () {
      expect(Exercise9.Integral(fSin).trapezoid(x0,xPi, e), allOf([lessThan(sinResult+e),greaterThan(sinResult-e)]));
    });

    test('Интеграл $fLn на [$x0, $x1] не определен, получаем исключение', () {
      expect(() => Exercise9.Integral(fLn).trapezoid(x0, x1), throwsA(TypeMatcher<Exercise9.ValueNotDefinedException>()));
    });


  });

  var adminUser=Exercise8.AdminUser('admin@admin.ru');
  var generalUser1=Exercise8.GeneralUser('user1@user.ru');
  var generalUser2=Exercise8.GeneralUser('user2@user.ru');
  var userManager=Exercise8.UserManager<Exercise8.User>();
  userManager.addUser(adminUser);
  userManager.addUser(generalUser1);
  userManager.addUser(generalUser2);
  print(userManager.getEmails());
}

