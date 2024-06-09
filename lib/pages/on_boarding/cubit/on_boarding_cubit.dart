import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/constants/Strings.dart';
import 'package:e_commerce/core/helper/cache_helper.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:flutter/material.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    emit(NextScreenChangeState());
  }

  void prevPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    emit(PrevScreenChangeState());
  }

  void onPageChanged(int i) {
    currentIndex = i;
    emit(OnPageChangedState());
  }

  void navigatoToSignUp(context) {
    Navigator.pushReplacementNamed(context, Routes.signUp);
    CacheHelper.setString(SharedPrefrencesKeys.onBoarding, '1');
  }
}
