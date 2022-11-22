class Item {
  final int id;
  final String name;

  Item(this.id, this.name);
}


abstract class Store {
  Store();
  void add(Item item);
  Item get(int id);
  void delete(Item item);
  void update(Item item);
}

class StoreDB extends Store {
  late String name;
  StoreDB(String name):super() {
    this.name=name;
  }

  @override
  void add(Item item) {
    // TODO: implement add
  }

  @override
  void delete(Item item) {
    // TODO: implement delete
  }

  @override
  Item get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  void update(Item item) {
    // TODO: implement update
  }
}

void main() {
  print('123');
}