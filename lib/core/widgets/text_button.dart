import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingTextButton extends StatelessWidget {
  const OnBoardingTextButton(
      {super.key, required this.onPressed, required this.text, this.color});
  final void Function() onPressed;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: color ?? AppColors.white),
        ));
  }
}
