import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/services/auth_service.dart';
import 'package:flutter_mobile_shopping_app/user_dao_firesbase_firestore.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<MyUser?> _myUserFromFirebase(User? user) async {
    if (user == null) {
      return null;
    } else {
      late MyUser myUser;
      myUser = await UserDAOFirebaseFireStore().findById(user.uid);
      return myUser;
    }
  }

  Future<MyUser> getUser(User user) async {
    late MyUser myUser;
    myUser = await UserDAOFirebaseFireStore().findById(user.uid);
    return myUser;
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return await _myUserFromFirebase(userCredential.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<MyUser?> signUpWithEmailAndPassword(
      String email, String password, String name, String surname) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    /* await UserDAOFirebaseFireStore().save(MyUser(
        id: userCredential.user!.uid,
        email: email,
        password: password,
        firstName: name,
        lastName: surname)); */

    return await _myUserFromFirebase(userCredential.user);
  }

  @override
  Future<MyUser?> currentUser() async {
    MyUser? myUser = await _myUserFromFirebase(_firebaseAuth.currentUser);
    return myUser;
  }
}
