// import 'package:coffee_card/widgets/themes.dart';
// import 'package:flutter/cupertino.dart';
import 'package:coffee_card/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],

      )
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();
  @override
  Widget build(BuildContext context) {
  final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        "\$${_cart.totalPrice}".text.xl5.color(context.theme.highlightColor).make(),
        30.widthBox,
        ElevatedButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported".text.make()));
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
          context.theme.colorScheme.secondary)
        ),
        child: "Buy".text.white.make()
        ).w24(context),

      ],)
    );
  }
}

class _CartList extends StatefulWidget {
  
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
        icon: Icon(Icons.remove_circle_outline),
        onPressed: (){}
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}