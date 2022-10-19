import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';



class CatalogModelNotifier extends ChangeNotifier {
  CatalogModel catalogModel;


  CatalogModelNotifier(this.catalogModel);

  void add() {

    catalogModel.addRandom();
    print(catalogModel.getList());
    notifyListeners();
  }






}