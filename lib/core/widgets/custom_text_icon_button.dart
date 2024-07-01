import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextIconButton extends StatelessWidget {
  const CustomTextIconButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.color,
    required this.icon,
  });
  final Function() onTap;
  final String buttonText;
  final Color? color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              buttonText,
              style: TextStyle(
                  color: color ?? AppColors.lightergreyColor, fontSize: 16.sp),
            ),
            const HorizontalSpace(width: 5),
            FaIcon(
              icon,
              color: color ?? AppColors.lightergreyColor,
              size: 14.r,
            )
          ],
        ));
  }
}
