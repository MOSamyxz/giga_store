import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.hintText,
    this.controller,
    this.isReadOnly = false,
    this.prefix,
    this.onSubmit,
    this.onChange,
    this.onTab,
  });

  final String hintText;
  final TextEditingController? controller;
  final IconData? prefix;
  final bool isReadOnly;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.darkGreyColor),
      readOnly: isReadOnly,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTab,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: AppColors.lightergreyColor,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.lightergreyColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: const BorderSide(color: AppColors.blue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: const BorderSide(color: AppColors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0.r),
            borderSide: const BorderSide(color: AppColors.lightergreyColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.r),
          borderSide: const BorderSide(color: AppColors.lightergreyColor),
        ),
      ),
    );
  }
}
