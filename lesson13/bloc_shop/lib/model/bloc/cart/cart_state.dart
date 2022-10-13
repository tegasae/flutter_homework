part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState(this.cartModel);
  final CartModel cartModel;
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  const CartInitial(super.cartModel);


}

class CartSuccess extends CartState {
  const CartSuccess(super.cartModel);

}

class CartChange extends CartState {
  const CartChange(super.cartModel);

}




