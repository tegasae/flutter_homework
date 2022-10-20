import 'package:bloc/bloc.dart';
import 'package:data/data.dart';

class CatalogCubit extends Cubit<CatalogModel> {
  CatalogModel catalogModel;

  CatalogCubit(this.catalogModel) : super(catalogModel);
  void catalogAdd() {
    state.addRandom();
    emit(state);
  }
}