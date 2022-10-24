import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  late CartModel cartModel;
  CartCubit(this.cartModel) : super(CartInitial(cartModel));

  void add(Item item) {
    cartModel.add(item);
    print('add');
    print(state);
    print(state==CartAdd(cartModel,item));
    emit(CartAdd(cartModel,item));

  }

  void clear() {
    print(state);
    state.cartModel.removeAll();
    emit(CartInitial(cartModel));
    emit(CartInitial(cartModel));
    print(state);
  }

  void remove(int index) {
    Item item=cartModel.items[index];

    state.cartModel.remove(item);
    emit(CartRemove(cartModel, item));
  }


}


