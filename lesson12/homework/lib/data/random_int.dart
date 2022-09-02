import 'dart:async';
import 'dart:math';



class ContainerData {
  final int value;

  const ContainerData(this.value);
  static const empty=ContainerData(0);

  String getStr() {
    return value.toString();
  }
}


abstract class Generate {
  bool flag=true;

  ContainerData value();

  Stream<ContainerData> get() {
    return Stream.periodic(const Duration(seconds: 1), (x) =>value())
        .takeWhile((element) => flag);
  }
}

class RandomStream extends Generate {
  Random random=Random();
  @override
  ContainerData value() {
    return ContainerData(random.nextInt(100));
  }



}

class SecuenceStream extends Generate {
  int start=0;

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

