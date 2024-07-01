import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/pages/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

class SplashSlideAnimation extends StatelessWidget {
  const SplashSlideAnimation({
    super.key,
    required this.splash,
  });

  final SplashCubit splash;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: splash.slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: splash.slidingAnimation,
            child: const Column(
              children: [
                Text(
                  'Giga Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: AppColors.white),
                ),
                Text(
                  'Giga Savings, Giga Choices',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: AppColors.white),
                ),
              ],
            ),
          );
        });
  }
}
