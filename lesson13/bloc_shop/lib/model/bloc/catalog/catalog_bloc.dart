
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {

  late CatalogModel catalogModel;
  CatalogBloc(this.catalogModel) : super(CatalogInitial()) {
    print('-----');
    print(catalogModel.getList());
    on<CatalogAdding>(_onAdd);
  }

  void _onAdd(CatalogAdding event, Emitter<CatalogState> emit) {
    print('adding 1');
    print(state);
    //print(catalogModel.getList());
    catalogModel.add(getRandomString(10));
    emit(CatalogInitial());
    emit(CatalogSucsess());
  }
}
