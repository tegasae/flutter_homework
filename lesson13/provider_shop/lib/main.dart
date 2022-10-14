//import 'package:data/data.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/provider/cart.dart';
import 'package:provider_shop/model/provider/catalog.dart';

import 'view/cart.dart';
import 'view/catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CatalogModel catalogModel = CatalogModel();
    final CartModel cartModel = CartModel(catalogModel);

    //provider
    final catalogModelNotifier=CatalogModelNotifier(catalogModel);
    final cartModelNotifier=CartModelNotifier(cartModel);

    //provider
    return MultiProvider(providers: [
      //ChangeNotifierProvider.value(value: catalogModelNotifier),
      //ChangeNotifierProvider.value(value: cartModelNotifier)
      ChangeNotifierProvider(create: (_)=>CatalogModelNotifier(catalogModel)),
      ChangeNotifierProvider(create: (_)=>CartModelNotifier(cartModel)),
    ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme:  ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              //fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {

          '/': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
      ),);
  }
}

