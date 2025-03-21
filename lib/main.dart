import 'package:coffee_card/pages/home_page.dart';
import 'package:coffee_card/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';
import 'package:coffee_card/pages/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.logInRoute: (context) => const LoginPage(),
        MyRoutes.cartRoutes: (context) => CartPage(),
      },
    );
  }
}
