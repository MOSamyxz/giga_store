import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/auth/auth_repo.dart';
import 'package:e_commerce/services/firestore/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserSignUp extends SignUpRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<UserModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String type,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        _sendVerificationEmail();
        UserModel user = UserModel(
          uId: userCredential.user!.uid,
          userName: username,
          email: email,
          imageUrl: '',
          type: type,
        );
        await saveUserData(
          user: user,
        );
        return user;
      }
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<void> saveUserData({required UserModel user}) async {
    await _firestoreService.saveUserData(
        collection: 'users', doc: user.uId, user: user);
  }

  Future<void> _sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser!.sendEmailVerification();
      _showToast('Please check your email for verification link');
    } catch (e) {
      _showToast('Faild to send verification email. Please try again');
    }
  }

  _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        _showToast('The password provided is too weak');
        break;
      case 'email-already-in-use':
        _showToast('The account already exists for that email');
        break;
      case 'invalid-email':
        _showToast('The email address is not valid');
        break;
      default:
        _showToast('An error occurred. Please try again.');
    }
  }
}
