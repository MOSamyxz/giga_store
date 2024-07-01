import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(
      {required String collection,
      required String doc,
      required UserModel user}) async {
    await _firestore.collection(collection).doc(doc).set(user.toMap());
  }
}
