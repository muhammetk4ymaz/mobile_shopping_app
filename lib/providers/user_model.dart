// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/services/auth_service.dart';
import 'package:flutter_mobile_shopping_app/services/firebase_auth_service.dart';

enum ViewState { Idle, Busy }

class UserModel extends ChangeNotifier implements AuthService {
  ViewState _state = ViewState.Idle;
  MyUser? _myUser;
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

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

  @override
  Future<MyUser?> currentUser() async {
    try {
      state = ViewState.Busy;
      _myUser = await _firebaseAuthService.currentUser();
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
      await _firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      currentUser();
      state = ViewState.Idle;
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    try {
      state = ViewState.Busy;
      await _firebaseAuthService.signOut();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _myUser = null;
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser?> signUpWithEmailAndPassword(
      String email, String password, String name, String surname) async {
    try {
      state = ViewState.Busy;
      await _firebaseAuthService.signUpWithEmailAndPassword(
          email, password, name, surname);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      currentUser();
      state = ViewState.Idle;
    }
    return null;
  }
}
