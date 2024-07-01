import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/pages/splash/cubit/splash_cubit.dart';
import 'package:e_commerce/pages/splash/ui/parts/splash_fade_animation.dart';
import 'package:e_commerce/pages/splash/ui/parts/splash_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: AppColors.blueGradient,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight),
              ),
              child: BlocProvider(
                create: (context) => SplashCubit()..initState(context),
                child: BlocBuilder<SplashCubit, SplashState>(
                  builder: (context, state) {
                    var splash = BlocProvider.of<SplashCubit>(context);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SplashFadeAnimation(splash: splash),
                        SplashSlideAnimation(splash: splash)
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
