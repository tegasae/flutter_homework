import 'dart:convert';
import 'dart:io';

main() async {
  print('main');
  File file = File('123.txt');
  readAsStream(file);
  readSync(file);

  final filename = 'file.txt';
  var file1 = await File(filename);//.writeAsString('some content');

  var sink = file1.openWrite();
  sink.write('FILE ACCESSED ${DateTime.now()}\n');

  // Close the IOSink to free system resources.
  sink.close();

  //var line = stdin.readLineSync(encoding: utf8);
  //print(line);

  List s=sieve(1000000000);
  print(s.length);
}

void readAsStream(File file) async {
  Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
  await for (var line in lines) {
    print('$line: ${line.length} characters');
  }


}

void readSync(File file) {
  List<String> lines = file.readAsLinesSync();
  lines.forEach((l) => print(l));
}

List<int> sieve(int n) {
  List<int> s=List<int>.filled(n, 1);
  List<int> s1=List<int>.empty(growable: true);
  for (int i=2;i*i<=n;i++) {
    if (s[i]==1) {
      for (int j=i*i;j<n;j+=i) {
        s[j]=0;
      }

    }

  }
  for (int i=1;i<n;i++) {
    if (s[i]==1) {
      s1.add(i);
    }
  }
  return s1;
}