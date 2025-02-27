import 'package:coffee_card/pages/home_page.dart';
import 'package:coffee_card/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/home",
      routes: {
        "/": (context) => LogInpage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LogInpage(),
      },
    );
  }
}
