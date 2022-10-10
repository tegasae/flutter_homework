import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(CatalogModel catalogModel) : super(CatalogInitial()) {
    on<CatalogAdding>(_onAdd);
  }

  void _onAdd(CatalogAdding event, Emitter<CatalogState> emit) {

  }
}
