import 'dart:async';

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}


class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  var _count = 1;
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}

void main() async {
  //final myStream = countStream(10).asBroadcastStream();
  Stream<int> t=timedCounter(Duration(milliseconds: 100),10);
  Stream<int> t1=timedCounter(Duration(milliseconds: 100),10);
  print(await t.cast());

  t1.listen((event) {event=1;});
  await for (final i in t.skip(2).take(2).where((event) => event>2)
                          .map((event) => (event+2))) {
    print(i);
  }

  await for (final i in t1) {
    print(i);
  }
  //final subscription = myStream.listen(
  //      (data) => print('Data: $data'),
  //);

  //final subscription1 = NumberCreator().stream.listen(
  //      (data) => print('Data1: $data'),
  //);

  //final subscription2 = myStream.listen(
  //      (data) {
  //    print('Data2: $data');
  //  },
  //  onError: (err) {
  //    print('Error!');
  //  },
  //  cancelOnError: false,
  //  onDone: () {
  //    print('Done!');
  //  },
  //);
  //print('hello');
  //print(subscription);

}

Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

