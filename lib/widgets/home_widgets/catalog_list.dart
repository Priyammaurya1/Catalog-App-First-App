// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:coffee_card/models/cart.dart';
import 'package:coffee_card/models/catalog.dart';
import 'package:coffee_card/pages/home_detail_page.dart';
import 'package:coffee_card/widgets/home_widgets/catalog_image.dart';
import 'package:coffee_card/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog),
                ),
              ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(context.theme.highlightColor)
                    .bold
                    .make(),
                catalog.desc.text
                    .textStyle(context.captionStyle)
                    .color(context.theme.highlightColor)
                    .make(),
                Padding(
                  padding: Vx.mOnly(right: 8.0),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl
                          .color(context.theme.highlightColor)
                          .make(),
                          _AddToCart(catalog: catalog),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {

   bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog= _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          context.theme.colorScheme.secondary,
        ),
        shape: WidgetStateProperty.all(StadiumBorder()),
      ),
      child: isAdded? Icon(Icons.done) : "Buy".text.bold.color(MyTheme.creamcolor).make(),
    );
  }
}
