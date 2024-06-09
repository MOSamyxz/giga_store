// text_styles.dart
import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle textStyle30WhiteBold = TextStyle(
    fontSize: 30.0.sp,
    height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle textStyle12White =
      TextStyle(fontSize: 12.sp, height: 1, color: AppColors.white);

  static TextStyle textStyle32DarkGreyW500 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreyColor);
}
