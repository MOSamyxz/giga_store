part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

final class NextScreenChangeState extends OnBoardingState {}

final class PrevScreenChangeState extends OnBoardingState {}

final class OnPageChangedState extends OnBoardingState {}
