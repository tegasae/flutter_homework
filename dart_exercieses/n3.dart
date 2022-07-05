import 'dart:io';

import 'dart:math';

main() {
  File file = File('input.txt');
  File file1 = File('output.txt');
  List<String> lines = file.readAsLinesSync();
  int n = int.parse(lines[0]);


  int countNegative = 0;
  int countZero = 0;
  int countPositive=0;
  bool oddNegative = true;
  int give = 0;

  List<int> items = lines[1].split(' ').map((e) => int.parse(e)).toList();
  int minNegative = items[0];
  int maxNegative=items[0];
  int minPositive = items[0];


  for (var i = 0; i < n; i++) {
    //print(items[i]);
    if ((items[i] >= 0)) {
      if ((items[i])==0) {
        countZero++;
      } else {
        countPositive++;
      }
      if (minPositive >= items[i]) {
        minPositive = items[i];
      }
    }
    if (items[i] < 0) {
      countNegative++;
      if (minNegative > items[i]) {
        minNegative = items[i];

        continue;
      }

      if (maxNegative < items[i]) {
        maxNegative = items[i];
        continue;
      }
    }


    }


  oddNegative = countNegative % 2 == 0;
  //print(minNegative);
  //print('---');

  if (countNegative==0) {
    give=minPositive;
  } else {
    if (oddNegative) {
      if (countZero == 0) {
        give = maxNegative;
      } else {
        give = minNegative;
      }
    } else {
      if (countZero==0) {
        give=maxNegative;
      } else {
        give=minNegative;
      }
    }

    }


print(give);

var sink = file1.openWrite();
sink.write(give);
// Close the IOSink to free system resources.
sink.close();

//print(give);
//print(str[start]);

}