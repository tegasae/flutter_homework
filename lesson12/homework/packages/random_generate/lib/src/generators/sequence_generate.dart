import '../../random_generate.dart';

class SequenceGenerate extends Generate {

  final int maxCount=15;
  int count=0;

  SequenceGenerate(super.name);

  @override
  void init() {
    super.init();
    print('init');
    count=0;
  }

  @override
  ContainerData value() {
    if (count>=maxCount) {
      flag=false;
    }
    count+=1;
    return ContainerData(count);
  }
}

