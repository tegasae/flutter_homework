import 'dart:async';

main () {
  StreamController<double> controller = StreamController<double>.broadcast();
  StreamSubscription streamSubscription=controller.stream.listen((event) {print(event);});

  NumberCreator numberCreator=NumberCreator();
  controller.onCancel=cancel;

  print('123');
  controller.add(1);
  controller.add(2);
  streamSubscription.cancel();

  numberCreator.stream.listen((event) {print(event);});

}

void cancel() {
  print('cancel');
}

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.add(_count);
      _count++;
    });
  }

  var _count = 1;
  final _controller = StreamController<int>(onCancel: (){});

  Stream<int> get stream => _controller.stream;
}