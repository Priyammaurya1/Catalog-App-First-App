import 'dart:convert';
import 'package:coffee_card/models/catalog.dart';
import 'package:flutter/material.dart'; 
import 'package:coffee_card/widgets/drawer.dart';
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
        ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index){
            final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridTile(
                header: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF9000),
                  ),
                  child: Text(
                    item.name,
                    style: TextStyle(color: Colors.white),
                    ),
                ),
                footer: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,   //.withAlpha((0.6 * 255).toInt()),
                  ),
                  child: Text(
                    item.price.toString(),
                    style: TextStyle(color: Colors.white),
                    ),
                ),
                child: Image.network(item.image),
              ));
          }, 
          itemCount: CatalogModel.items.length,
          )
        : Center(child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
