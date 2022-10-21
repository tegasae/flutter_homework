import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import 'package:data/data.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  late CatalogModel catalogModel;
  CatalogCubit(this.catalogModel) : super(CatalogSuccess(catalogModel));
  void catalogAdd() {
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




