import 'package:coffee_card/pages/home_page.dart';
import 'package:coffee_card/pages/login.dart';
import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';


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
      initialRoute: MyRoutes.homeRoutes,
      routes: {
        "/": (context) => LogInpage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.logInRoute: (context) => LogInpage(),
      },
    );
  }
}
