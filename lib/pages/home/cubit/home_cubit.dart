import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  UserModel? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*   Future<void> getUserData() async {
    emit(GetCurrentUserDataLoadingState());
    if (_auth.currentUser?.uid != null) {
      UserModel user = await _firestoreServices.getUserDetails(
          collection: 'users', doc: _auth.currentUser!.uid);
      _user = user;
    }
    emit(GetCurrentUserDataSuccessState());
  }
   */
  Future<void> getUserData() async {
    try {
      emit(GetCurrentUserDataLoadingState());
      User? firebaseUser = _auth.currentUser;
      if (firebaseUser != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('sellers').doc(firebaseUser.uid).get();
        UserModel user =
            UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        _user = user;
        emit(GetCurrentUserDataSuccessState(user));
      } else {
        emit(GetCurrentUserDataErrorState("User not logged in"));
      }
    } catch (e) {
      emit(GetCurrentUserDataErrorState(e.toString()));
    }
  }

  UserModel get getUser => _user!;
}
