import 'package:e_commerce/core/constants/styles.dart';
import 'package:e_commerce/core/helper/validator.dart';
import 'package:e_commerce/core/widgets/custom_bautton.dart';
import 'package:e_commerce/core/widgets/custome_text_field.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:e_commerce/pages/auth/sign_in/ui/parts/dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
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
              const VerticalSpace(height: 12),
              CustomTextFormField(
                hintText: 'Email',
                controller: BlocProvider.of<SignInCubit>(context).email,
                validator: (input) {
                  return validInput(input!, 6, 16, 'email', context);
                },
              ),
              const VerticalSpace(height: 16),
              CustomTextFormField(
                hintText: 'Password',
                controller: BlocProvider.of<SignInCubit>(context).password,
                suffix: BlocProvider.of<SignInCubit>(context).ishide
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                suffixPressed: () {
                  BlocProvider.of<SignInCubit>(context).showPassword();
                },
                isPassword: BlocProvider.of<SignInCubit>(context).ishide,
                validator: (input) {
                  return validInput(input!, 6, 32, 'password', context);
                },
              ),
              const VerticalSpace(height: 16),
              CustomButton(
                onPressed: () {
                  BlocProvider.of<SignInCubit>(context)
                      .signInUserWithEmailAndPassword(context);
                },
                child: BlocProvider.of<SignInCubit>(context).isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Sign In'),
              ),
              const VerticalSpace(height: 16),
              DontHaveAccount(
                info: 'Don\'t have an account?',
                buttonText: 'Sign up',
                onPressed: () {
                  BlocProvider.of<SignInCubit>(context)
                      .navigatoToSignIn(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
