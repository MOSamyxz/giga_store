import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/routes/routs.dart';
import 'package:e_commerce/services/auth/user_auth/user_signin.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool ishide = true;
  String type = 'seller';

  void navigatoToSignIn(context) {
    Navigator.pushReplacementNamed(context, Routes.signUp);
  }

  void showPassword() {
    ishide = !ishide;
    emit(ShowHidePasswordState());
  }

  void onTypeSelected(int index) {
    if (index == 0) {
      type = 'seller';
    } else if (index == 1) {
      type = 'customer';
    }
  }

  Future<void> signInUserWithEmailAndPassword(context) async {
    if (formkey.currentState!.validate()) {
      emit(SignInLoadingState());
      isLoading = true;
      try {
        await UserSignIn().signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        Fluttertoast.showToast(
          msg: 'Please check the verification link send to your email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        Navigator.pushReplacementNamed(context, Routes.home);

        isLoading = false;
        emit(SignInSuccessState());
      } on Exception catch (e) {
        emit(SignInErrorState());
        e.toString();
      }
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
