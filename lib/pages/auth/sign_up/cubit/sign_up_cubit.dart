import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void navigatoToSignIn(context) {
    Navigator.pushReplacementNamed(context, Routes.signIn);
  }
}
