// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:data/data.dart' show Item ;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/provider/cart.dart';

import 'package:provider_shop/model/provider/catalog.dart';


class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) => Consumer<CatalogModelNotifier>(builder:(context,catalog,child){print(index);return _MyListItem(index);}))),
                    //(context, index) =>  _MyListItem(index))),

        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    print('add button');
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isInCart = context.select<CartModelNotifier, bool>(
      // Here, we are only interested whether [item] is inside the cart.
          (cart) => cart.inCart(item),
    );
    //var catalog=context.watch<CatalogModelNotifier>();
    //var isInCart=catalog.inCart(item);
    print('${item.name}');
    print('$isInCart');

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
        // If the item is not in cart, we let the user add it.
        // We are using context.read() here because the callback
        // is executed whenever the user taps the button. In other
        // words, it is executed outside the build method.
        //var catalog = context.read<CatalogModelNotifier>();
        //catalog.addCart(item);
        var cart = context.read<CartModelNotifier>();
        cart.add(item);

      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('app bar');
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      pinned: true,
      actions: [
        IconButton(icon: const Icon(Icons.add),onPressed: (){
          CatalogModelNotifier catalog=context.read<CatalogModelNotifier>();
          catalog.add();
        }),
        IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () => Navigator.pushNamed(context, '/cart'),
      ),
        IconButton(
          icon: const Icon(Icons.remove_shopping_cart),
          onPressed: () {

            CatalogModelNotifier catalogModelNotifier=context.read<CatalogModelNotifier>();
            catalogModelNotifier.removeAllCart();
          },
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    print('item');
    var item = context.select<CatalogModelNotifier, Item>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
          (catalog) => catalog.catalogModel.getByPosition(index)
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
