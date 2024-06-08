import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/text_button.dart';
import 'package:e_commerce/pages/on_boarding/parts/bottom_indicator.dart';
import 'package:e_commerce/pages/on_boarding/parts/on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? for Background gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: AppColors.blueGradient,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ),
        //? OnBoarding
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(onPressed: () {}, text: 'Skip'),
                ],
              ),

              //? OnBoarding page
              OnBoardingBody(),
              //? OnBoarding page indicator
              BottomIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
