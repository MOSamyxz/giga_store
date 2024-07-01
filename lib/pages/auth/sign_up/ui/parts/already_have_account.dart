import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/custom_text_button.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount(
      {super.key,
      required this.info,
      required this.buttonText,
      required this.onPressed});

  final String info;
  final String buttonText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          info,
          style: TextStyle(color: AppColors.darkGreyColor, fontSize: 16.sp),
        ),
        const HorizontalSpace(
          width: 5,
        ),
        CustomTextButton(
          onTap: onPressed,
          color: AppColors.blue,
          buttonText: buttonText,
        )
      ],
    );
  }
}
