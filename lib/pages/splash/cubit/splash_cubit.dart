import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:e_commerce/core/routes/slide_route.dart';
import 'package:e_commerce/pages/on_boarding/pages/on_boarding_screen.dart';
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
      Navigator.push(context, SlideRoute(page: OnBoardingScreen()));
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
  /*
  void dispose() {
    animationController.dispose();
    print('disposed');
    super.close();
  }*/
}

class MyTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(onTick) => Ticker(onTick);

  void dispose() {}
}
