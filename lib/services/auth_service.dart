import 'package:flutter_mobile_shopping_app/models/my_user.dart';

abstract class AuthService {
  Future<MyUser?> signUpWithEmailAndPassword(
      String email, String password, String name, String surname);
  Future<MyUser?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<MyUser?> currentUser();
}
