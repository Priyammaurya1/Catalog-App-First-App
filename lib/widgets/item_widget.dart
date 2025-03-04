import 'package:flutter/material.dart';
import 'package:coffee_card/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});
    // : assert(item != null);
  

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0.0,
      child: ListTile(
        onTap: (){
          print("${item.name}, pressed");
          },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(
          color: Color(0xFFFF9000),
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}