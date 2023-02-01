import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blueGrey,
      cardColor: Vx.white,
      canvasColor: creamcolor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blueGrey,
      cardColor: creamcolor,
      canvasColor: darkred,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ));

  static Color creamcolor = const Color(0xfff5f5f5);
  static Color darkred = const Color.fromARGB(255, 102, 47, 47);
  static Color lightgreen = const Color.fromARGB(255, 162, 188, 152);
}
