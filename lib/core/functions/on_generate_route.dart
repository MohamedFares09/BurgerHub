import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/login/presentation/widget/login_view.dart';
import 'package:hungry_app/feature/home/presentation/home_view.dart';
import 'package:hungry_app/feature/splash/presentation/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
