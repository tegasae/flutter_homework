import 'dart:io';

main() {
  File file = File('input.txt');
  File file1 = File('output.txt');
  List<String> lines = file.readAsLinesSync();
  int n=int.parse(lines[0]);
  String str=lines[1];

  List<int> times=lines[2].split(' ').map((e) => int.parse(e)).toList();
  int start=0;
  int maxTime=times[0];
  int currentTime=times[0];
  for (int i=1;i<times.length;i++) {
    currentTime=times[i]-times[i-1];
    //print(currentTime);
    //print(maxTime);
    //print('--');
    if (currentTime>=maxTime) {
      start=i;
      maxTime=currentTime;
    }
  }

  var sink = file1.openWrite();
  sink.write(str[start]);

  // Close the IOSink to free system resources.
  sink.close();
  //print(str[start]);

}