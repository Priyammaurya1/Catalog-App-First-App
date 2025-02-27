import 'package:coffee_card/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double pi = 3.14;
    // bool isMale = true;

    // var day = "Saturday";
    // const pie = 3.14;

    return MaterialApp(home: HomePage());
  }
}
