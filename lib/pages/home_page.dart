// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:coffee_card/models/catalog.dart';
import 'package:coffee_card/widgets/themes.dart';
// import 'package:coffee_card/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';



class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 354 - 46;

  final String name = "Cooler";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = 
      await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
    .map<Item>((item) => Item.fromMap(item))
    .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea( 
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[ CatalogHeader(),
            if(CatalogModel.items.isNotEmpty)
            CatalogList().expand()
            else
            Center(child: CircularProgressIndicator(),
              )
            ]
          ),
        ),
      )
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
              "Trending Products".text.xl2.make(),
            ],
          );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      }
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              Padding(
                padding: Vx.mOnly(right: 8.0),
                child: OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        MyTheme.darkBluishColor,
                        ),
                        shape: WidgetStateProperty.all(StadiumBorder(),
                        )),
                    child: "Buy".text.bold.color(MyTheme.creamcolor).make(),
                    )
                  ],
                
                ),
              )
            ],)
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key,required this.image,}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image).box.rounded.p8
      .color(MyTheme.creamcolor)
      .make().p16().w40(context);
  }
}
