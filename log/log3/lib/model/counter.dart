class Counter {
  int count;

  Counter(this.count);

  int calculate() {

    count+=10;
    return count;
  }
}

class CounterFuture{
  int count=0;

  CounterFuture(this.count);
  Future<int> calculate() async {
    count+=1;
    Future.delayed(
      const Duration(seconds: 2),
    );
    print(count);
    return count;
  }

}