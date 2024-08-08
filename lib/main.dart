import 'package:cubitdemo/src/config/route/app_routes.dart';
import 'package:cubitdemo/src/config/route/route_handler.dart';
import 'package:cubitdemo/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ValueNotifier to manage the theme mode
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, child) {
        return MaterialApp(
          title: 'Cubit Demo',
          initialRoute: AppRoutes.splashScreen,
          onGenerateRoute: AppRouteHandler.onGenerateRoute,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,
        );
      },
    );
  }
}
