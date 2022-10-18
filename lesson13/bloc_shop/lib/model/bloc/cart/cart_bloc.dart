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
    on<CartClearing>(_onClear);
    on<CartRemoving>(_onRemove);


  }

  void _onAdd(CartAdding event,Emitter<CartState> emit) {
    //state.cartModel.add(event.item);
    print(cartModel.items);
    cartModel.add(event.item);
    print(state);

      emit(CartAdd(cartModel,event.item));


  }

  void _onClear(CartClearing event, Emitter<CartState> emit) {
    state.cartModel.removeAll();
    emit(CartInitial(cartModel));
  }

  void _onRemove(CartRemoving event, Emitter<CartState> emit) {
    Item item=cartModel.items[event.index];
    print(event.index);
    state.cartModel.remove(item);
    emit(CartRemove(cartModel, item));
  }

}
