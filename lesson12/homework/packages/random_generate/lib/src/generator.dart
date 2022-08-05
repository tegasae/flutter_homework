abstract class Generator<T> {

  Stream<T> value() async* {

  }

  Future<void> generate();
  void dispose();
}