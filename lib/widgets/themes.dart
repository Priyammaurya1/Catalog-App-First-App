import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamcolor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkBluishColor),   // for button color (cart)
        highlightColor: darkBluishColor,     // title
        appBarTheme: AppBarTheme(color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    // brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamcolor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightBluishColor),   // for button color (cart)
      highlightColor: Colors.white,   // title
      appBarTheme: AppBarTheme(color: Colors.black, 
      elevation: 0.0,
      iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
      toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white) ?? TextStyle(color: Colors.white),
    )
  );

  //colors
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkCreamcolor =  Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;


}