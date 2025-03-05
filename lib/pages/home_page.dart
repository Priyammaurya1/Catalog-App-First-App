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
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    print(productsData); 
  }

  // void print(String catalogJson){
  //   print(catalogJson);
  // }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(30, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          }
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
