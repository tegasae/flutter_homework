// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.



import '../data.dart';
import 'catalog.dart';
import 'item.dart';


class CartModel {
  /// The private field backing [catalog].
  late CatalogModel catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.




  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.

  }
  bool inCart(Item item) {
    return items.contains(item);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.

  }
  //add removeAll
  void removeAll() {
    _itemIds.clear();
  }
}
