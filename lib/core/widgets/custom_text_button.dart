import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.color,
  });
  final Function() onTap;
  final String buttonText;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Text(
          buttonText,
          style: TextStyle(color: color ?? AppColors.blue, fontSize: 16.sp),
        ));
  }
}
