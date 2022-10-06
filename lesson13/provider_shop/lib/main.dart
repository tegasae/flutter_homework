//import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/cart.dart';
import 'package:provider_shop/model/catalog.dart';

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
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>CatalogModelNotifier()),
      ChangeNotifierProxyProvider<CatalogModelNotifier, CartModelNotifier>(
        create: (context) => CartModelNotifier(),
        update: (context, catalog, cart) {
          print('$catalog');
          if (cart == null) throw ArgumentError.notNull('cart');
          cart.newCatalog(catalog.catalogModel);
          return cart;
        },
      ),
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

