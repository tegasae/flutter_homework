import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class CatalogModelNotifier extends ChangeNotifier {
  CatalogModel catalogModel;


  CatalogModelNotifier(this.catalogModel);

  void add() {

    catalogModel.add(getRandomString(10));
    notifyListeners();
  }
}