import 'package:homework1/exercise1.dart';
import 'package:homework1/exercise2.dart';
import 'package:homework1/exercise3.dart';
import 'package:homework1/exercise6.dart';
import 'package:homework1/exercise7.dart';
import 'package:homework1/exercise8.dart';

main() {


  int n;
  int n2;
  int n3;
  print("Hello");
  n=gcd(11,5);
  //print(n);
  n2=lcm(4,6);
  //print(n2);

  print(NumbersCollection.getNumbers('efvrr 1 rg4tg 2 rg4rg'));
  Calculate c=Calculate(10);
  print(c.gcd(5));
  print(c.lcm(1));
  print(DecBin.dec2bin(0));
  print(DecBin.bin2dec(1));

  Point p0=Point.zero();
  Point p1=Point.unit();
  print(p0.distanceTo(p1));
  Point p3=Point(1,2,3);
  Point p4=Point(-4,-5,-6);
  print(p3.distanceTo(p4));
  Point p5=Point(1,2,3);
  print(p3.distanceTo(p5));

  AdminUser adminUser=AdminUser('1@11.ru');
  print(adminUser.email);
  GeneralUser generalUser=GeneralUser('11@11.ru');
  print(generalUser.email);

  UserManager<User> um=UserManager<User>();
  um.addUser(AdminUser('2@22.ru'));
  um.addUser(GeneralUser('3@33.ru'));
  print(um.getEmails());
  //print(dec2bin(10));
  //print(bin2dec(100));
  //print(distance(1,2,3,10,20,30));
  //print(nthRoot(10.0).sqrt_new(3,0.000001));
  //print(power(1000,10));
}