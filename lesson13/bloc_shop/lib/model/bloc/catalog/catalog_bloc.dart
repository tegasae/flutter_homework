
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
  CatalogBloc(this.catalogModel) : super(CatalogInitial(catalogModel)) {
    print('-----');
    print(catalogModel.getList());
    on<CatalogAdding>(_onAdd);
    on<CatalogViewing>(_onView);
  }

  void _onAdd(CatalogAdding event, Emitter<CatalogState> emit) {
    print('_onAdd');
    print(state);

    print('adding');
    catalogModel.add(getRandomString(10));
    emit(CatalogAdd(catalogModel));

  }

  void _onView(CatalogViewing event, Emitter<CatalogState> emit) {
    print('_onView');
    print(state);

    emit(CatalogSucsess(catalogModel));

  }
}
