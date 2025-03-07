import 'package:flutter/material.dart';
import 'package:coffee_card/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key,required this.image,});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image).box.rounded.p8
      .color(MyTheme.creamcolor)
      .make().p16().w40(context);
  }
}