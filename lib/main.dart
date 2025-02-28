import 'package:coffee_card/pages/home_page.dart';
import 'package:coffee_card/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.lateefTextTheme(),
      ),
      debugShowCheckedModeBanner: false, // to remove debug banner that appears at the corner of the app.
      darkTheme: ThemeData(brightness: Brightness.dark),
      // initialRoute: "/home",
      routes: {
        "/": (context) => LogInpage(),
         MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.logInRoute: (context) => LogInpage(),
      },
    );
  }
}
