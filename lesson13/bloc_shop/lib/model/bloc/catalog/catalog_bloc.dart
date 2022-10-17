


import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {

  late CatalogModel catalogModel;
  CatalogBloc(this.catalogModel) : super(CatalogInitial(catalogModel)) {
    print('-----');
    print(catalogModel.getList());
    on<CatalogAdding>(_onAdd);
    //on<CatalogViewing>(_onView);
  }

  void _onAdd(CatalogAdding event, Emitter<CatalogState> emit) {
    print('_onAdd');
    print(state);

    print('adding');
    //CatalogModel c=CatalogModel();
    //c.addRandom();
    catalogModel.addRandom();
    CatalogModel c=catalogModel;
    print(catalogModel.getList().length);
    emit(CatalogAdd(c));
  }

  //void _onView(CatalogViewing event, Emitter<CatalogState> emit) {
  //  print('_onView');
  //  print(state);
  //
  //  emit(CatalogSucsess(catalogModel));

 // }
}
