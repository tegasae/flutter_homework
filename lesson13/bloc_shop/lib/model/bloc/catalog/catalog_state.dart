part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState(this.catalogModel);
  final CatalogModel catalogModel;
  @override
  List<Object> get props => [catalogModel];
}

class CatalogInitial extends CatalogState {
  const CatalogInitial(super.catalogModel);


}

class CatalogSucsess extends CatalogState {
  const CatalogSucsess(super.catalogModel);

}

class CatalogAdd extends CatalogState {
  const CatalogAdd(super.catalogModel);
  @override
  List<Object> get props => [catalogModel];
}

