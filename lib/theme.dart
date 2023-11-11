import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Colors.black),
      gapPadding: 10);

  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: titleTextStyle(),
      centerTitle: true);
}

TextStyle titleTextStyle() {
  return TextStyle(
      color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400);
}
