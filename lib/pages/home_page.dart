// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coffee_card/utils/routes.dart';
import 'package:coffee_card/widgets/home_widgets/catalog_header.dart';
import 'package:coffee_card/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coffee_card/models/catalog.dart';
// import 'package:coffee_card/widgets/themes.dart';
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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoutes),
        backgroundColor: Theme.of(context).colorScheme.secondary,  // for button color (cart)
        child: Icon(CupertinoIcons.cart,
        color: Colors.white,
      )
      ),
      body: SafeArea( 
        child: Container(
          padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[ CatalogHeader(),
            if(CatalogModel.items.isNotEmpty)
            CatalogList().py16().expand()
            else
            CircularProgressIndicator().centered().expand(),
            ]
          ),
        ),
      )
    );
  }
}