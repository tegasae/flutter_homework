import 'dart:async';
import 'dart:io';
import 'dart:math';

class GenerateNumber {
  final _controller = StreamController<int>();



  Random random=Random();

  bool flag=true;
  GenerateNumber() {
    //_controller.addStream(Stream<int>.periodic(Duration(seconds: 1000)).t);
    _controller.onListen=_startGenerate;
    _controller.onCancel=_stopGenerate;

    _controller.onPause=_pauseGenerate;
    _controller.onResume=_resumeGenerate;


  }
  Stream<int> get stream => _controller.stream;

  void generate() async {
    final stream = Stream<int>.periodic(
        const Duration(milliseconds: 200), (count) => random.nextInt(100)).takeWhile((element) => flag);
    await _controller.addStream(stream);
  }

  void _startGenerate() async {

    //_stopGenerate();
    flag=true;

      generate();
      print(_controller.hasListener);

  }

  void _stopGenerate() {
    flag=false;
    print('cancel');
    print(_controller.hasListener);
    _controller.close();
    print(_controller.hasListener);
  }

  void _pauseGenerate() {
    print(_controller.hasListener);
  }

  void _resumeGenerate() {
      print(_controller.isPaused);
      //flag = true;

  }
}

void main() {
  StreamSubscription subscription;
  GenerateNumber generateNumber=GenerateNumber();
  subscription=generateNumber.stream.listen((item) => {print(item)});
  subscription.resume();

  //subscription.cancel();
  
}