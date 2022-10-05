import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Provider(create: (context)=>CatalogModel())
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
         // '/cart': (context) => const MyCart(),
        },
      ),);
  }
}

