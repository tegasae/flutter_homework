import 'package:flutter/material.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate:
          SliverChildBuilderDelegate((context,index)=>_ListItem(index)))

        ],
      ),
    );
  }
}


class _ListItem extends StatelessWidget {
  final int index;

  const _ListItem(this.index);

  @override
  Widget build(BuildContext context) {
    //var item = context.select<CatalogModel, Item>(
      // Here, we are only interested in the item at [index]. We don't care
      // about any other change.
    //      (catalog) => catalog.getByPosition(index),
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
                //color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              //child: Text(item.name, style: textTheme),
              child: Text('123'),
            ),
            const SizedBox(width: 24),
            //_AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
