import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/services/auth_service.dart';
import 'package:flutter_mobile_shopping_app/services/dummy_auth_service.dart';
import 'package:flutter_mobile_shopping_app/services/firebase_auth_service.dart';
import 'package:flutter_mobile_shopping_app/user_dao_firesbase_firestore.dart';

enum ViewState { Idle, Busy }

class UserModel extends ChangeNotifier implements AuthService {
  ViewState _state = ViewState.Idle;
  MyUser? _myUser;
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final DummyAuthService _dummyAuthService = DummyAuthService();

  ViewState get state => _state;

  MyUser? get myUser {
    return _myUser;
  }

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
     currentUser();
  }

  /*  Future<void> updateUser(MyUser myUser, MyUser newMyUser) async {
    _myUser = await UserDAOFirebaseFireStore().update(myUser, newMyUser);
    notifyListeners();
  } */

  @override
  Future<MyUser?> currentUser() async {
    try {
      state = ViewState.Busy;
      //  _myUser = await _firebaseAuthService.currentUser();
      _myUser = await _dummyAuthService.currentUser();
      return _myUser;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      state = ViewState.Busy;
      _myUser = await _dummyAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      return _myUser;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      state = ViewState.Busy;
      // await _firebaseAuthService.signOut();
      await _dummyAuthService.signOut();
      _myUser = null;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser?> signUpWithEmailAndPassword(
      String email, String password, String name, String surname) async {
    try {
      state = ViewState.Busy;
      _myUser = await _firebaseAuthService.signUpWithEmailAndPassword(
          email, password, name, surname);
      return _myUser;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }
}
