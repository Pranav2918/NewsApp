import 'package:cubitdemo/src/config/theme/app_colors.dart';
import 'package:cubitdemo/src/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.lightThemeBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.lightThemePrimaryColor,
      iconTheme: IconThemeData(color: AppColors.lightThemeIconColor),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightThemePrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: appTextThemeLight(),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkThemePrimaryColor,
      scaffoldBackgroundColor: AppColors.darkThemeBackgroundColor,
      appBarTheme: const AppBarTheme(
        color: AppColors.darkThemePrimaryColor,
        iconTheme: IconThemeData(color: AppColors.darkThemeIconColor),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.darkThemePrimaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: appTextThemeDark()
      // Add other theme properties as needed
      );
}
