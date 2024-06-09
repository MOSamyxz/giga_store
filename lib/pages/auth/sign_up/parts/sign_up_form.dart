import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/constants/styles.dart';
import 'package:e_commerce/core/widgets/custom_bautton.dart';
import 'package:e_commerce/core/widgets/custome_text_field.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:e_commerce/pages/auth/sign_up/parts/already_have_account.dart';
import 'package:e_commerce/pages/auth/sign_up/parts/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              'Create Your Account',
              style: AppStyles.textStyle32DarkGreyW500,
            ),
          ),
          const CustomTextFormField(hintText: 'Username'),
          const VerticalSpace(height: 16),
          const CustomTextFormField(hintText: 'Email'),
          const VerticalSpace(height: 16),
          const CustomTextFormField(hintText: 'Password'),
          const VerticalSpace(height: 16),
          CustomButton(
            onPressed: () {},
            child: const Text('Sign Up'),
          ),
          const VerticalSpace(height: 16),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '- Or -',
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const VerticalSpace(height: 16),
          const GoogleSignInButton(),
          const VerticalSpace(height: 16),
          AlreadyHaveAnAccount(
            info: 'Already have an account?',
            buttonText: 'Sign in',
            onPressed: () {
              BlocProvider.of<SignUpCubit>(context).navigatoToSignIn(context);
            },
          ),
        ],
      ),
    );
  }
}
