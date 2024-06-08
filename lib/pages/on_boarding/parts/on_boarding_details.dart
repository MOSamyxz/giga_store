import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/on_boarding/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingDetails extends StatelessWidget {
  const OnBoardingDetails({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? OnBoarding image
        Image.asset(
          onBoarding[index].imagePath,
          scale: 1.8,
        ),
        const VerticalSpace(height: 40),
        //? OnBoarding title
        Text(
          onBoarding[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30.sp,
              height: 1,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
        const VerticalSpace(height: 20),
        //? OnBoarding description
        Text(
          onBoarding[index].description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp, height: 1, color: AppColors.white),
        ),
      ],
    );
  }
}
