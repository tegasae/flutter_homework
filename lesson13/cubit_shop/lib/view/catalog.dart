// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:cubit_shop/model/cubit/cart_cubit.dart';
import 'package:cubit_shop/model/cubit/catalog_cubit.dart';
import 'package:data/data.dart' show Item;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    (context, index) => BlocBuilder<CatalogCubit, CatalogState>(
                  buildWhen: (prev, current) => prev != current,
                  builder: (context, state) {
                    print(' = = = $state');
                    return _MyListItem(index);
                  },
                ),
              )),
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
    //print('add button');
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    //CartModel cart=RepositoryProvider.of<CartModel>(context);
    //var isInCart=context.select(() => )
    //var isInCart = context.select<CartModelNotifier, bool>(
    //  // Here, we are only interested whether [item] is inside the cart.
    //      (cart) => cart.inCart(item),
    //);
    //var isInCart = true;
    final state = context.select((CartCubit bloc) => bloc.state);
    final isInCart = state.cartModel.inCart(item);

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
        // If the item is not in cart, we let the user add it.
        // We are using context.read() here because the callback
        // is executed whenever the user taps the button. In other
        // words, it is executed outside the build method.
        //var cart = context.read<CartModelNotifier>();

        //CartBloc bloc=context.read<CartBloc>();
        //bloc.add(CartAdding(item));
        //CatalogBloc catalogBloc=context.read<CatalogBloc>();
        //catalogBloc.emit(CatalogAdd(catalogBloc.catalogModel));
        //cart.add(item);
        var cart = context.read<CartCubit>();
        cart.add(item);
        //var cart;
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
        BlocBuilder<CatalogCubit, CatalogState>(
          //buildWhen: (previous,current)=>current.runtimeType==CatalogSucsess,
          builder: (context, state) {
            return IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  CatalogCubit catalogCubit = context.read<CatalogCubit>();
                  catalogCubit.catalogAdd();
                  //CatalogModelNotifier catalog=context.read<CatalogModelNotifier>();
                  //catalog.add();
                });
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
        IconButton(
          icon: const Icon(Icons.remove_shopping_cart),
          onPressed: () {
            //CartModelNotifier cartModelNotifier=context.read<CartModelNotifier>();
            //cartModelNotifier.removeAll();
            var cart = context.read<CartCubit>();
            cart.clear();
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
    //var item = RepositoryProvider.of<CatalogModel>(context).getByPosition(index);
    final state = context.select((CatalogCubit bloc) => bloc.state);
    final item = state.catalogModel.getByPosition(index);
    print(state);
    //print('${item.name}');
    //var item = context.select<CatalogModelNotifier, Item>(
    //  // Here, we are only interested in the item at [index]. We don't care
    //  // about any other change.
    //      (catalog) => catalog.catalogModel.getByPosition(index),

    //);
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
