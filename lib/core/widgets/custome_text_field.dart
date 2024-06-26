import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
    this.isShowCursor = true,
    this.isReadOnly = false,
    this.prefix,
    this.onSubmit,
    this.onChange,
    this.onTab,
    this.inputType,
  });

  final bool isPassword;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? prefix;
  final bool isShowCursor;
  final bool isReadOnly;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onTab;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(16.0),
      child: TextFormField(
          style: const TextStyle(color: AppColors.darkGreyColor),
          readOnly: isReadOnly,
          showCursor: isShowCursor,
          keyboardType: inputType,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTab,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            suffixIcon: IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
              ),
            ),
            label: Text(
              hintText,
              style: const TextStyle(color: Color.fromARGB(255, 194, 191, 199)),
            ),
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
                borderSide: const BorderSide(color: AppColors.white)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0.r),
              borderSide: const BorderSide(color: AppColors.white),
            ),
          ),
          validator: validator),
    );
  }
}
