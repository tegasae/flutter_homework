part of 'catalog_cubit.dart';





abstract class CatalogState extends Equatable {

  final CatalogModel catalogModel;

  const CatalogState(this.catalogModel);


  @override
  List<Object> get props => [catalogModel];
}

class CatalogSuccess extends CatalogState {
  const CatalogSuccess(super.catalogModel);

}

class CatalogAdd extends CatalogState {
  const CatalogAdd(super.catalogModel);
}

