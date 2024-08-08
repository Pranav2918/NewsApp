import 'package:cubitdemo/src/config/route/app_routes.dart';
import 'package:cubitdemo/src/domain/network_service/app_repository.dart';
import 'package:cubitdemo/src/presentation/news/cubit/news_cubit.dart';
import 'package:cubitdemo/src/presentation/news/views/news.dart';
import 'package:cubitdemo/src/presentation/news/views/news_details.dart';
import 'package:cubitdemo/src/presentation/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteHandler {
  AppRouteHandler._();

  static final appRouteHandler = AppRouteHandler._();

  factory AppRouteHandler() {
    return appRouteHandler;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NewsCubit(AppRepository()),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.newsDetails:
        final args =
            settings.arguments as Map<String, dynamic>?; // Use a nullable type
        if (args == null || !args.containsKey('news')) {
          // Handle missing or invalid arguments
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text('No news data available')),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => NewsDetails(
            news: args['news'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
