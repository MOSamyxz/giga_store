import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: AppColors.blue,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightScaffoldColor,
);
ThemeData darkTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: AppColors.blue,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkScaffoldColor,
);
