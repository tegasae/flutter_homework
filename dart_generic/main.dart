void main() {
  Data1<String> data1=Data1([]);
  Data data=PlusData<int>(1);
}

abstract class Data<T>{
  late T i;


  Data(T i) {
    this.i=i;
  }

  T operation<T>();
}


class PlusData<T> extends Data {
  PlusData(T i) : super(i) {

  }

  @override
  T operation<T>() {
    return i;
  }

}


class Data1<T> {
  List<T> _data = [];
  void push(T item) => _data.add(item);
  T pop() => _data.removeLast();

  T operation() {
    return _data.first;
  }

  Data1(this._data);
}

