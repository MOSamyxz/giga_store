part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetCurrentUserDataLoadingState extends HomeState {}

final class GetCurrentUserDataSuccessState extends HomeState {
  final UserModel user;

  GetCurrentUserDataSuccessState(this.user);
}

final class GetCurrentUserDataErrorState extends HomeState {
  final String message;

  GetCurrentUserDataErrorState(this.message);
}
