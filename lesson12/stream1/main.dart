import 'dart:async';
import 'dart:io';
import 'dart:math';

class ContainerData {
  final int value;

  const ContainerData(this.value);
  static const empty=ContainerData(0);

  String getStr() {
    return value.toString();
  }
}


abstract class Generator {
  final String name;
  late StreamController<ContainerData> controller;



  final int interval=1;
  bool flag=true;

  Generator(this.name) {


  }


    Future<void> startGenerator() async {


      while(flag) {
        controller.add(value());
        await new Future.delayed(const Duration(seconds : 1));

      }


    }

    void pauseGenerator() {
      flag=false;
    }

    void resumeGenerator() {
      flag=true;
    }
    void stopGenerator() {
      flag=false;
      controller.close();



    }


  ContainerData value();


  Stream<ContainerData> getController() {
    flag=true;
    controller = StreamController<ContainerData>(
        onListen: startGenerator,
        onPause: pauseGenerator,
        onResume: resumeGenerator,
        onCancel: stopGenerator);
    return controller.stream;
  }

}




void printContainerData(ContainerData event) {
  print(event.value);
}


class RandomGenerator extends Generator {
  Random random=Random();

  RandomGenerator(super.name);
  ContainerData value() {
    return ContainerData(random.nextInt(100));
  }
}

class SequenceGenerator extends Generator {
  final int maxCount=15;
  int count=0;
  SequenceGenerator(super.name);
  ContainerData value() {
    if (count>=maxCount) {
      flag=false;
      count=0;
    }
    count+=1;
    return ContainerData(count);
  }
}

main() async {
  Generator generatedStream = SequenceGenerator('name');



  StreamSubscription<ContainerData> subscription = generatedStream.getController().listen((event) {printContainerData(event);});
  await new Future.delayed(const Duration(seconds : 1));
  print('123');
  subscription.cancel();


  subscription = generatedStream.getController().listen((event) {printContainerData(event);});




}

