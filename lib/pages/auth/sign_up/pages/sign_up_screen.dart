import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/widgets/sign_in_sign_up_logo.dart';
import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:e_commerce/pages/auth/sign_up/parts/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return const Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VerticalSpace(height: 16),
                    SignInSignUpLogo(),
                    SignUpForm(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
