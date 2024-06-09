import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:flutter/material.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  void navigatoToSignIn(context) {
    Navigator.pushReplacementNamed(context, Routes.signUp);
  }
}
