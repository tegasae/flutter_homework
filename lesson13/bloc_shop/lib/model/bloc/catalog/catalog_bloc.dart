


import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {

  late CatalogModel catalogModel;
  CatalogBloc(this.catalogModel) : super(CatalogSuccess(catalogModel)) {
    print('-----');
    print(catalogModel.getList());
    on<CatalogAdding>(_onAdd);
    //on<CatalogViewing>(_onView);
  }

  void _onAdd(CatalogAdding event, Emitter<CatalogState> emit) {
    late CatalogState cs;
    catalogModel.addRandom();

    if (state is CatalogAdd) {
      cs=CatalogSuccess(catalogModel);
    }
    if (state is CatalogSuccess) {
      cs=CatalogAdd(catalogModel);
    }

    emit(cs);
  }


}
