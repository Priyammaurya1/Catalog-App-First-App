import 'package:coffee_card/models/catalog.dart';
import 'package:coffee_card/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl4.red800.make(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          context.theme.colorScheme.secondary,
                          ),
                        shape: WidgetStateProperty.all(StadiumBorder()),
                      ),
                    child: "Add to Cart".text.bold.color(MyTheme.creamcolor).make(),
                   ).wh(130,50),
                  ],
                ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.theme.highlightColor).bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).color(context.theme.highlightColor).xl.make(), 10.heightBox,
                      "Dolore magna et ea tempor amet. Sit labore amet amet ipsum. Sit amet amet amet ipsum. Dolore magna et ea tempor amet. Sit labore amet amet ipsum. Sit amet amet amet ipsum."
                      .text.textStyle(context.captionStyle).color(context.theme.highlightColor).align(TextAlign.center).make()
                      .p16(),
                    ],
                  ).py64()
                  ),
              ),)
          ],
        ),
      ),
    );
  }
}