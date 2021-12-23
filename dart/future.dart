void method1(){
  List<String> myArray = <String>['a1','b1','c1'];
  print('before loop1');
  myArray.forEach((String value) async {
    await delayedPrint(value);
  });
  print('end of loop1');
}

void method2() async {
  List<String> myArray = <String>['a2','b2','c2'];
  print('before loop2');
  for(int i=0; i<myArray.length; i++) {
    await delayedPrint(myArray[i]);
  }
  print('end of loop2');
}

Future<void> delayedPrint(String value) async {
  await Future.delayed(Duration(seconds: 1));
  print('delayedPrint: $value');
}
main () {
  method1();
  method2();
}

