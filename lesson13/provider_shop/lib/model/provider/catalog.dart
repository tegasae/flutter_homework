import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';



class CatalogModelNotifier extends ChangeNotifier {
  CatalogModel catalogModel;
  CartModel cartModel;

  CatalogModelNotifier(this.catalogModel,this.cartModel);

  void add() {

    catalogModel.addRandom();
    notifyListeners();
  }

  bool inCart(Item item) {

    return cartModel.inCart(item);
  }

  void addCart(Item item) {
    cartModel.add(item);
    print(cartModel.items);
    notifyListeners();
  }

  void removeAllCart() {
    cartModel.removeAll();
    notifyListeners();


  }
}