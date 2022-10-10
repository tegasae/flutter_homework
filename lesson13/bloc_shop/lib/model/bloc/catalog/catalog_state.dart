part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
}

class CatalogInitial extends CatalogState {
  @override
  List<Object> get props => [];
}

class CatalogSucces extends CatalogState {
  @override
  List<Object> get props=>[];
}
