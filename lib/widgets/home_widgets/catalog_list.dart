import 'package:coffee_card/pages/home_detail_page.dart';
import 'package:coffee_card/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:coffee_card/models/catalog.dart';
import 'package:coffee_card/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(
                    catalog: catalog,
                  ),
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
            child: CatalogImage(
              image: catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.theme.highlightColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).color(context.theme.highlightColor).make(),
                Padding(
                  padding: Vx.mOnly(right: 8.0),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl.color(context.theme.highlightColor).make(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            context.theme.colorScheme.secondary,
                          ),
                          shape: WidgetStateProperty.all(StadiumBorder()),
                        ),
                        child: "Buy".text.bold.color(MyTheme.creamcolor).make(),
                      ),
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
