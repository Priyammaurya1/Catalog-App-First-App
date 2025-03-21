import 'package:coffee_card/models/cart.dart';
import 'package:coffee_card/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final catalog = CatalogModel();
          _cart.catalog = catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          context.theme.colorScheme.secondary,
        ),
        shape: WidgetStateProperty.all(StadiumBorder()),
      ),
      child:
          isInCart
              ? Icon(Icons.done, color: Colors.white, size: 24.0)
              : Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
                size: 24.0,
              ),
    );
  }
}
