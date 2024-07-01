import 'package:e_commerce/pages/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:e_commerce/pages/on_boarding/ui/parts/on_boarding_details.dart';
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
        onPageChanged: (i) {
          BlocProvider.of<OnBoardingCubit>(context).onPageChanged(i);
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
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
