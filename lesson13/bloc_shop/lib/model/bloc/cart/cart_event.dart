part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props=>[];
}

class CartAdding extends CartEvent {
  final Item item;

  const CartAdding(this.item);
  @override
  List<Object> get props=>[item];
}

class CartRemoving extends CartEvent {
  final int index;

  const CartRemoving(this.index);
  @override
  List<Object> get props=>[index];
}

class CartClearing extends CartEvent {

}