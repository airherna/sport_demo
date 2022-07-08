import 'package:flutter/material.dart';

class ColorTheme {
  static ThemeData getColorTheme(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
        backgroundColor: Colors.black87,
        scaffoldBackgroundColor: Colors.black87);
  }
}
