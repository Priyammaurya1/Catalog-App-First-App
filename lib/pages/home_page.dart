import 'package:flutter/material.dart'; 
import 'package:coffee_card/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 354 - 46;
  final String name = "Cooler";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog App',
          ),
      ),
      body: Center(child: Container(child: Text('welcome home $days $name'))),
      drawer: MyDrawer(),
    );
  }
}
