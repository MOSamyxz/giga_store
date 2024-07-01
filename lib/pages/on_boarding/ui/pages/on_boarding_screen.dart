import 'package:e_commerce/pages/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:e_commerce/pages/on_boarding/ui/parts/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          return const OnBoardingView();
        },
      ),
    );
  }
}
