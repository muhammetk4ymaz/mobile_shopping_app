import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/user_dao.dart';

class UserDAOFirebaseFireStore implements UserDAO {
  final userCollection = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> delete(MyUser myUser) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<MyUser>> findAll() async {
    List<MyUser> myUsers = [];
    var userDocuments = await userCollection.get();
    for (var element in userDocuments.docs) {
      myUsers.add(MyUser.fromMap(element.data()));
    }
    return myUsers;
  }

  @override
  Future<MyUser> findById(String id) async {
    var userDocuments = await userCollection.get();
    for (var element in userDocuments.docs) {
      if (element.data()['uid'] == id) {
        return MyUser.fromMap(element.data());
      }
    }
    return Future.error('ERROR');
  }

  @override
  Future<void> save(MyUser myUser) async {
    try {
      await userCollection.doc().set(myUser.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> update(MyUser myUser) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
