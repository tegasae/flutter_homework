import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  late CartModel cartModel;
  CartBloc(this.cartModel) : super(CartInitial(cartModel)) {

    on<CartAdding>(_onAdd);
  }

  void _onAdd(CartAdding event,Emitter<CartState> emit) {
    state.cartModel.add(event.item);
    print(cartModel.items);
    emit(CartChange(cartModel));
    emit(CartSuccess(cartModel));

  }

}
