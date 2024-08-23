// routes for the app
import 'package:ermilov_sad_manager/src/screens/home/index.dart';
import 'package:ermilov_sad_manager/src/screens/onboarding/authentication_screen.dart';
import 'package:ermilov_sad_manager/src/splash_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/auth':
      return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
