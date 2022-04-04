import 'dart:async';

main() async {
  Ticker ticker=Ticker();
  await for (var i in ticker.tick(ticks: 10)) {
    print(i);
  }
  StreamSubscription subscription=ticker.tick(ticks: 10).listen((event) {});

  print('123');
}

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) { print('x='+x.toString()); return ticks - x - 1;}).skip(5);
  }
}
