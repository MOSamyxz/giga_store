import 'package:e_commerce/core/widgets/space.dart';
import 'package:e_commerce/pages/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:e_commerce/pages/on_boarding/parts/on_boarding_deatails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: BlocProvider.of<OnBoardingCubit>(context).controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const VerticalSpace(height: 60),
              //? OnBoarding image, title and description
              OnBoardingDetails(
                index: index,
              ),
            ],
          );
        },
      ),
    );
  }
}
