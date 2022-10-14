// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class CartModelNotifier extends ChangeNotifier {
  CartModel cartModel;


  CartModelNotifier(this.cartModel);


  void newCatalog(CatalogModel catalog) {
    cartModel.catalog=catalog;
    notifyListeners();
  }

  void add(Item item) {
    cartModel.add(item);
    notifyListeners();
  }

  void remove(int index) {
    cartModel.remove(cartModel.items[index]);
    notifyListeners();
  }

  void removeAll() {
    //funny
    for (var i in cartModel.items) {
      cartModel.remove(i);
    }
    notifyListeners();
  }

}