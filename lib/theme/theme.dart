import 'package:flutter/material.dart';


class CustomTheme {
  const CustomTheme._();

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: CustomColors.purple,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white54,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
      );
}


class CustomColors {
  const CustomColors._();

  static const purple = Colors.purpleAccent;
  static const lightGreen = Colors.greenAccent;
  static const textColor = Colors.black;
  static const List<Color> scaffoldColors = [
    Color(0xff25282B),
    Color(0xff80c7a9),
  ];
}

