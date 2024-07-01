import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:e_commerce/services/auth/user_auth/user_signup.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String type = 'Seller';
  Uint8List? image;
  bool isLoading = false;
  bool ishide = true;

  void onTypeSelected(int index) {
    if (index == 0) {
      type = 'Seller';
    } else if (index == 1) {
      type = 'Customer';
    }
  }

  void showPassword() {
    ishide = !ishide;
    emit(ShowHidePasswordState());
  }

  Future<void> signUpUserWithEmailAndPassword(context) async {
    if (formkey.currentState!.validate()) {
      emit(SignUpLoadingState());
      isLoading = true;
      try {
        await UserSignUp().createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
            username: userName.text,
            type: type);
        Navigator.pushReplacementNamed(context, Routes.signIn);
        Fluttertoast.showToast(
          msg: 'Please check the verification link send to your email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        isLoading = false;
        emit(SignUpSuccessState());
      } on Exception catch (e) {
        emit(SignUpErrorState());
        e.toString();
      }
    }
  }

  void navigatoToSignIn(context) {
    Navigator.pushReplacementNamed(context, Routes.signIn);
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    userName.dispose();
    return super.close();
  }
}
