import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final PageController controller = PageController(initialPage: 0);

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

  void navigatoToSignUp() {}
}
