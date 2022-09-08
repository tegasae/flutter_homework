import '../../random_generate.dart';

class SequenceGenerate extends Generate {
  int start=0;

  SequenceGenerate(super.name);

  @override
  ContainerData value() {
    int v;
    start+=1;
    v=start;
    if (start>=2) {
      flag=false;
      start=0;
    }
    return ContainerData(v);
  }
}

