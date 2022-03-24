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

void main() {
  final myStream = countStream(10).asBroadcastStream();


  final subscription = myStream.listen(
        (data) => print('Data: $data'),
  );

  final subscription1 = NumberCreator().stream.listen(
        (data) => print('Data1: $data'),
  );

  final subscription2 = myStream.listen(
        (data) {
      print('Data2: $data');
    },
    onError: (err) {
      print('Error!');
    },
    cancelOnError: false,
    onDone: () {
      print('Done!');
    },
  );
  print('hello');
  print(subscription);

}

