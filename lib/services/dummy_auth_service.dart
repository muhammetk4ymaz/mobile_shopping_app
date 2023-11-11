import 'dart:convert';

import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

class DummyAuthService implements AuthService {
  static const String _url = 'https://dummyjson.com/users';
  static List<MyUser> _list = [];
  MyUser? _myUser;

  static Future<void> getUsers() async {
    final response = await http.get(Uri.parse(_url));
    Map<String, dynamic> data = await json.decode(response.body);
    List mapUser = data['users'];
    _list = mapUser.map((e) {
      MyUser myUser = MyUser.fromMap(e);
      return myUser;
    }).toList();
  }

  @override
  Future<MyUser?> currentUser() async {
    return _myUser;
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await getUsers();
      for (var element in _list) {
        if (element.email == email && element.password == password) {
          _myUser = element;
          return element;
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<void> signOut  () async{
     _myUser = null;
  }

  @override
  Future<MyUser?> signUpWithEmailAndPassword(
      String email, String password, String name, String surname) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
