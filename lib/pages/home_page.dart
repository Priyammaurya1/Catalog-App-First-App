import 'package:coffee_card/models/catalog.dart';
import 'package:flutter/material.dart'; 
import 'package:coffee_card/widgets/drawer.dart';
import 'package:coffee_card/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 354 - 46;
  final String name = "Cooler";
  const HomePage({super.key});

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
