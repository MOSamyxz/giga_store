// routes.dart
import 'package:e_commerce/pages/auth/sign_in/ui/pages/sign_in_screen.dart';
import 'package:e_commerce/pages/auth/sign_up/ui/pages/sign_up_screen.dart';
import 'package:e_commerce/pages/home/ui/pages/home_screen.dart';
import 'package:e_commerce/pages/on_boarding/ui/pages/on_boarding_screen.dart';
import 'package:e_commerce/pages/splash/ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signup';
  static const String signIn = '/signin';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      //  home: (context) => HomeScreen(),
      splash: (context) => const SplashScreen(),
      onboarding: (context) => const OnBoardingScreen(),
      signUp: (context) => const SignUpScreen(),
      signIn: (context) => const SignInScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}
