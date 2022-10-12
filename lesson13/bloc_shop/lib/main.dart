//import 'package:data/data.dart';
import 'package:bloc_shop/model/bloc/cart/cart_bloc.dart';
import 'package:bloc_shop/model/bloc/catalog/catalog_bloc.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/catalog.dart';


//import 'view/cart.dart';
//import 'view/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CatalogModel catalogModel = CatalogModel();
  final CartModel cartModel=CartModel();
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cartModel.catalog=catalogModel;
    return RepositoryProvider.value(

      value: catalogModel,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CatalogBloc(catalogModel),
          ),
          BlocProvider(create: (context)=>CartBloc(cartModel))

        ],
        child: MaterialApp(
          title: 'Provider Demo',
          theme: ThemeData(
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
            //  '/cart': (context) => const MyCart(),
          },
        ),
      ),
    );
  }
}

