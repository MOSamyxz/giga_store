import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/constants/Strings.dart';
import 'package:e_commerce/core/helper/cache_helper.dart';
import 'package:e_commerce/core/routes/slide_route.dart';
import 'package:e_commerce/pages/auth/sign_up/ui/pages/sign_up_screen.dart';
import 'package:e_commerce/pages/home/ui/pages/home_screen.dart';
import 'package:e_commerce/pages/on_boarding/ui/pages/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    animationController = AnimationController(
      vsync: MyTickerProvider(),
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);

    fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
  }

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;

  void initState(BuildContext context) {
    startAnimation();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          SlideRoute(
              page:
                  CacheHelper.getString(SharedPrefrencesKeys.onBoarding) == '1'
                      ? StreamBuilder(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              // Checking if the snapshot has any data or not
                              if (snapshot.hasData) {
                                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                                return const HomeScreen();
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('${snapshot.error}'),
                                );
                              }
                            }
                            // means connection to future hasnt been made yet
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return const SignUpScreen();
                          })
                      : const OnBoardingScreen()));
    });
  }

  void startAnimation() {
    animationController.forward();
  }

  @override
  Future<void> close() {
    animationController.dispose();
    return super.close();
  }
}

class MyTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(onTick) => Ticker(onTick);
}
