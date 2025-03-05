import 'dart:convert';
import 'package:coffee_card/models/catalog.dart';
import 'package:flutter/material.dart'; 
import 'package:coffee_card/widgets/drawer.dart';
import 'package:coffee_card/widgets/item_widget.dart';
import 'package:flutter/services.dart';



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
    // final dummyList = List.generate(30, (index) => CatalogModel.items[0]); // no use of dummy list
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App'
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
        ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index]
              );
          },
        ): Center(child: CircularProgressIndicator(),
        )
      ),
      drawer: MyDrawer(),
    );
  }
}
