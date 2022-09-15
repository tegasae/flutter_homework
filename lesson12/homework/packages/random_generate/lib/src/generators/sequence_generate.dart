import '../../random_generate.dart';

class SequenceGenerate extends Generate {
  int start=0;

  SequenceGenerate(super.name) {
    print('construtor');
  }

  @override
  ContainerData value() {
    int v;
    start+=1;
    v=start;
    print('value: $flag');
    if (start>=10) {
      flag=false;
    }
    if (flag==false) {
      start=0;
    }
    return ContainerData(v);
  }
}

