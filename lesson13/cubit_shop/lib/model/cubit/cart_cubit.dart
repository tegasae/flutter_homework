import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  late CartModel cartModel;
  CartCubit(this.cartModel) : super(CartInitial(cartModel));

  void add(Item item) {
    cartModel.add(item);
    print(state);
    emit(CartAdd(cartModel,item));

  }

  void clear() {
    state.cartModel.removeAll();
    emit(CartInitial(cartModel));
  }

  void remove(int index) {
    Item item=cartModel.items[index];

    state.cartModel.remove(item);
    emit(CartRemove(cartModel, item));
  }


}


