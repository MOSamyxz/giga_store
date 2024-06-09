import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/constants/styles.dart';
import 'package:e_commerce/core/widgets/custom_bautton.dart';
import 'package:e_commerce/core/widgets/custome_text_field.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:e_commerce/pages/auth/sign_in/parts/dont_have_account.dart';
import 'package:e_commerce/pages/auth/sign_up/parts/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
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
              'Login to Your Account',
              style: AppStyles.textStyle32DarkGreyW500,
            ),
          ),
          const CustomTextFormField(hintText: 'Email'),
          const VerticalSpace(height: 16),
          const CustomTextFormField(hintText: 'Password'),
          const VerticalSpace(height: 16),
          CustomButton(
            onPressed: () {},
            child: const Text('Sign in'),
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
          DontHaveAccount(
            info: 'Don\'t have an account?',
            buttonText: 'Sign up',
            onPressed: () {
              BlocProvider.of<SignInCubit>(context).navigatoToSignIn(context);
            },
          ),
        ],
      ),
    );
  }
}
