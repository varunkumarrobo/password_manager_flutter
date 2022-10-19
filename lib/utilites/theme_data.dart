
import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
      textTheme: const TextTheme(
        headline4: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
        headline5: TextStyle(color: Colors.black, fontSize: 26),
        bodyText2: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(245, 247, 251, 1),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
        ),
      ));
}
