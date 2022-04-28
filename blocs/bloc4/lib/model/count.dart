

class Counter {
  int count;

  Counter(this.count);

  void increment({int i =1}) {

    count+=i;
    //count=-1*count;
    //print("count $count");
  }

  Future<int> fetchInt() async {


    return Future.delayed(Duration(seconds: 2),()=>count);
  }

}
