part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState(this.cartModel);
  final CartModel cartModel;
  @override
  List<Object> get props => [cartModel];
}

class CartInitial extends CartState {
  const CartInitial(super.cartModel);
}

class CartSuccess extends CartState {
  const CartSuccess(super.cartModel);

}

class CartAdd extends CartState {
  final Item item;
  const CartAdd(super.cartModel, this.item);
  @override
  List<Object> get props => [cartModel,item];
}

class CartRemove extends CartState {
  final Item item;
  const CartRemove(super.cartModel, this.item);
  @override
  List<Object> get props => [cartModel,item];
}




