import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/constants/styles.dart';
import 'package:e_commerce/core/helper/validator.dart';
import 'package:e_commerce/core/widgets/custom_bautton.dart';
import 'package:e_commerce/core/widgets/custome_text_field.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:e_commerce/pages/auth/sign_up/ui/parts/already_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: BlocProvider.of<SignUpCubit>(context).formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'Create Your Account',
                    style: AppStyles.textStyle32DarkGreyW500,
                  ),
                ),
                ToggleSwitch(
                  minWidth: double.infinity,
                  minHeight: 50.h,
                  initialLabelIndex: 0,
                  cornerRadius: 16.r,
                  activeFgColor: AppColors.white,
                  inactiveBgColor: AppColors.lightergreyColor,
                  inactiveFgColor: AppColors.white,
                  totalSwitches: 2,
                  fontSize: 18.sp,
                  labels: const ['Seller', 'Customer'],
                  activeBgColor: const [AppColors.blue],
                  onToggle: (index) {
                    BlocProvider.of<SignUpCubit>(context)
                        .onTypeSelected(index!);
                  },
                ),
                const VerticalSpace(height: 12),
                CustomTextFormField(
                  hintText: 'Username',
                  controller: BlocProvider.of<SignUpCubit>(context).userName,
                  validator: (input) {
                    return validInput(input!, 6, 16, 'username', context);
                  },
                ),
                const VerticalSpace(height: 12),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: BlocProvider.of<SignUpCubit>(context).email,
                  validator: (input) {
                    return validInput(input!, 6, 16, 'email', context);
                  },
                ),
                const VerticalSpace(height: 12),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: BlocProvider.of<SignUpCubit>(context).password,
                  suffix: BlocProvider.of<SignUpCubit>(context).ishide
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  suffixPressed: () {
                    BlocProvider.of<SignUpCubit>(context).showPassword();
                  },
                  isPassword: BlocProvider.of<SignUpCubit>(context).ishide,
                  validator: (input) {
                    return validInput(input!, 6, 32, 'password', context);
                  },
                ),
                const VerticalSpace(height: 12),
                CustomButton(
                  onPressed: () {
                    BlocProvider.of<SignUpCubit>(context)
                        .signUpUserWithEmailAndPassword(context);
                  },
                  child: BlocProvider.of<SignUpCubit>(context).isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Sign Up'),
                ),
                const VerticalSpace(height: 16),
                AlreadyHaveAnAccount(
                  info: 'Already have an account?',
                  buttonText: 'Sign in',
                  onPressed: () {
                    BlocProvider.of<SignUpCubit>(context)
                        .navigatoToSignIn(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
