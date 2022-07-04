import 'dart:io';

main() {
  File file = File('input.txt');
  File file1 = File('output.txt');
  List<String> lines = file.readAsLinesSync();
  int n = int.parse(lines[0]);
  Set<String> login = {};

  for (int i=1;i<=n;i++) {
    List<String> user;
    user=lines[i].split('@');
    user[0]=user[0].replaceAll('.', '');
    user[0]=user[0].replaceAll(RegExp(r'-.+$'), '');
    //print(user);
    user[1]=user[1].replaceAll(RegExp(r'\.\w+$'), '');
    login.add(user[0]+'@'+user[1]);
  }

  var sink = file1.openWrite();
  //print(login.length);
  sink.write(login.length);

  // Close the IOSink to free system resources.
  sink.close();
  //print(str[start]);
}
