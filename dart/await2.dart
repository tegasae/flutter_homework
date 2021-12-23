void main() async {
  methodA();

  var f=methodC('main');
  //print(f);

  methodD();
  print(await f);
  print('end');
}

methodA(){
  print('A');
}


Future<String> methodC(String from) async {
  print('C start from $from');


  return Future((){                // <== Этот код будет исполнен когда-то в будущем

    print('C running Future from $from');
    //Future.delayed(Duration(seconds: 10));
    for (var i=0;i<100000000;i++) {
      if (i % 1000000==0) {
        print(i);
      }
    }
    return "Future";

  }).then((_){

    print('C end of Future from $from');
    return "Then";
  });


}

methodD(){
  print('D');
}
