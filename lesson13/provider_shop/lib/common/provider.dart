import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/provider/cart.dart';

import '../model/provider/catalog.dart';

class CommonProvider {
  late MultiProvider multiProvider;
  //ChangeNotifierProvider changeNotifierProvider;
  CatalogModel catalogModel;
  CartModel cartModel;
  Widget child;
  late CartModelNotifier cartModelNotifier;


  CommonProvider(this.catalogModel, this.cartModel, this.child) {
    multiProvider=MultiProvider(providers: [
          ChangeNotifierProvider(create: (_)=>CatalogModelNotifier(catalogModel)),
          ChangeNotifierProvider(create: (_)=>CartModelNotifier(cartModel)),
        ],
        child: child);
    }

   Widget getProvider() {
    return multiProvider;
   }

   Widget generateItem(BuildContext context,Widget childItem,int index) {

        var consumer=Consumer<CatalogModelNotifier>(builder:(context,catalog,child) {return childItem;});
        return consumer.buildWithChild(context,childItem);

      //return Consumer<CatalogModelNotifier>(builder:(context,catalog,child){return childItem;});
   }

   void catalogAdd(BuildContext context) {
    var catalog=context.read<CatalogModelNotifier>();
     catalog.add();
   }

   bool isInCart(Item item,BuildContext context) {
     return context.select<CartModelNotifier, bool>(
       // Here, we are only interested whether [item] is inside the cart.
           (cart) => cart.cartModel.inCart(item),
     );
   }

   void cartAdd(Item item,BuildContext context) {
     var cart = context.read<CartModelNotifier>();
     cart.add(item);
   }

   void removeAllCart(BuildContext context) {
     CartModelNotifier cartModelNotifier=context.read<CartModelNotifier>();
     cartModelNotifier.removeAll();
   }

   Item getItem(int index,BuildContext context) {
     var item = context.select<CatalogModelNotifier, Item>(
       // Here, we are only interested in the item at [index]. We don't care
       // about any other change.
             (catalog) => catalog.catalogModel.getByPosition(index)
     );
     return item;
   }

   void cartRemove(int index) {
    //CartModelNotifier cart=;
    //cartModel.remove(item);
     cartModelNotifier.remove(index);
   }

   Item getItemIndex(index) {
    return catalogModel.getByPosition(index);
   }


   void watchCart(BuildContext context) {
    cartModelNotifier= context.watch<CartModelNotifier>();
   }

   int getLenCart() {
    return cartModelNotifier.cartModel.items.length;
   }
   int getPrice() {
      print(cartModelNotifier.cartModel.totalPrice);
      //return 123;

     return cartModelNotifier.cartModel.totalPrice;
   }

  Widget generateCart(BuildContext context,Widget childItem) {

    var consumer=Consumer<CartModelNotifier>(builder:(context,cart,child) {return childItem;});
    return consumer.buildWithChild(context,childItem);

    //return Consumer<CatalogModelNotifier>(builder:(context,catalog,child){return childItem;});
  }
}

