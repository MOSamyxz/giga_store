// routes.dart
import 'package:e_commerce/pages/auth/sign_up/pages/sign_up_screen.dart';
import 'package:e_commerce/pages/on_boarding/pages/on_boarding_screen.dart';
import 'package:e_commerce/pages/splash/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signup';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      //  home: (context) => HomeScreen(),
      splash: (context) => const SplashScreen(),
      onboarding: (context) => const OnBoardingScreen(),
      signUp: (context) => const SignUpScreen(),
    };
  }
}
