import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/text_button.dart';
import 'package:e_commerce/pages/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_sliding_indicator/page_view_sliding_indicator.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //? Skip button to navigate to sign in / sign up Screen
          CustomTextButton(onPressed: () {}, text: 'Skip'),
          //? The indicatior widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: PageViewSlidingIndicator(
              color: AppColors.white,
              borderRadius: 5,
              pageCount: 3,
              controller: BlocProvider.of<OnBoardingCubit>(context).controller,
              size: 8,
            ),
          ),
          //? Next button to move to next screen
          CustomTextButton(
              onPressed: () {
                BlocProvider.of<OnBoardingCubit>(context).nextPage();
              },
              text: 'Next'),
        ],
      ),
    );
  }
}
