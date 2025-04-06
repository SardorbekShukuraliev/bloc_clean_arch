import '../../features/home/presentation/pages/home_page.dart';
import '/core/route/route_names.dart';
import 'package:flutter/material.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());

      // case RouteNames.byCategoryPage:
      //   final categoryData = routeSettings.arguments as Map<String, String>;
      //   return MaterialPageRoute(
      //       builder: (_) => ProductByCategoryPage(data: categoryData));
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
