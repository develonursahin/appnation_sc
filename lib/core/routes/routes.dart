import 'package:appnation_sc/presentation/home/home_view.dart';
import 'package:appnation_sc/presentation/main/main_view.dart';
import 'package:appnation_sc/presentation/settings/settings_view.dart';
import 'package:appnation_sc/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
