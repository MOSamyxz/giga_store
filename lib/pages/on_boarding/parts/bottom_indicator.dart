import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/text_button.dart';
import 'package:e_commerce/pages/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Skip button to navigate to sign in / sign up Screen
              CustomTextButton(
                  color:
                      BlocProvider.of<OnBoardingCubit>(context).currentIndex ==
                              0
                          ? Colors.transparent
                          : AppColors.white,
                  onPressed: () {
                    BlocProvider.of<OnBoardingCubit>(context).prevPage();
                  },
                  text: 'Prev'),
              //? The indicatior widget
              SmoothPageIndicator(
                controller:
                    BlocProvider.of<OnBoardingCubit>(context).controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.white,
                  dotColor: AppColors.white,
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  spacing: 5.0,
                ),
              ),
              //? Next button to move to next screen
              CustomTextButton(
                  onPressed: () {
                    BlocProvider.of<OnBoardingCubit>(context).nextPage();
                  },
                  text:
                      BlocProvider.of<OnBoardingCubit>(context).currentIndex ==
                              2
                          ? 'Start'
                          : 'Next'),
            ],
          ),
        );
      },
    );
  }
}
