import 'package:e_commerce/core/constants/assets.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/pages/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashFadeAnimation extends StatelessWidget {
  const SplashFadeAnimation({
    super.key,
    required this.splash,
  });

  final SplashCubit splash;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: splash.fadeAnimation,
      builder: (context, _) {
        return FadeTransition(
            opacity: splash.fadeAnimation,
            child: Image.asset(
              AppAssets.logo,
              color: AppColors.white,
              height: 200.h,
            ));
      },
    );
  }
}
