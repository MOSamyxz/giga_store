import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepo {
  Future<UserModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String type,
  });
  Future<void> saveUserData({
    required UserModel user,
  });
}

abstract class SignInRepo {
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
}
