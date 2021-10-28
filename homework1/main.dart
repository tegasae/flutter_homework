import 'package:test/test.dart';

import 'package:homework1/exercise1.dart';
import 'package:homework1/exercise2.dart';
import 'package:homework1/exercise3.dart';
import 'package:homework1/exercise4.dart';
import 'package:homework1/exercise5.dart';
import 'package:homework1/exercise6.dart';
import 'package:homework1/exercise7.dart';
import 'package:homework1/exercise8.dart';
import 'package:homework1/exercise9.dart';

main() {
  //Calculate calculate=Calculate(102);
  //print(calculate.gcd(5));
  //print(calculate.lcm(5));
  //print(calculate.findSimple());
  //exercise 4
  //print(CounterWords.counter(['wfrf','erfverver','word','verv','word']));
  //exercise 5
  //print(CounterNumbers.counterNumbers(['one, two, one, four, fwrf. zero, zero', 'nine, zero, erfwrf']));

  //m('2*2');

  test('String.split() splits the string on the delimiter', () {
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });

  test('String.trim() removes surrounding whitespace', () {
    var string = '  foo ';
    expect(string.trim(), equals('foo'));
  });
}