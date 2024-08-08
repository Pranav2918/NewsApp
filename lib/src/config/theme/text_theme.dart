import 'package:flutter/material.dart';

TextTheme appTextThemeLight({Color color = Colors.black}) {
  return TextTheme(
      titleLarge: TextStyle(color: color, fontSize: 16),
      titleMedium: TextStyle(color: color, fontSize: 14),
      titleSmall: TextStyle(color: color, fontSize: 14));
}

TextTheme appTextThemeDark({Color color = Colors.white}) {
  return TextTheme(
      titleLarge: TextStyle(color: color, fontSize: 16),
      titleMedium: TextStyle(color: color, fontSize: 14),
      titleSmall: TextStyle(color: color, fontSize: 14));
}
