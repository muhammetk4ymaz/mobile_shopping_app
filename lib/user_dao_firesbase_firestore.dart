import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/user_dao.dart';

class UserDAOFirebaseFireStore implements UserDAO {
  final userCollection = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> delete(MyUser myUser) {
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
    DocumentSnapshot documentSnapshot = await userCollection.doc(id).get();
    return MyUser.fromMap(documentSnapshot.data() as Map<String, dynamic>);
  }

  @override
  Future<void> save(MyUser myUser) async {
    /* try {
      await userCollection.doc(myUser.id).set(myUser.toMap());
    } catch (e) {
      debugPrint(e.toString());
    } */
  }

  @override
  Future<MyUser> update(MyUser myUser, MyUser newUser) async {
    if (myUser != newUser) {
      var userDocuments = await userCollection.get();
      for (var element in userDocuments.docs) {
        if (element.data()['id'] == myUser.id) {
          userCollection.doc(element.id).update(newUser.toMap());
          return newUser;
        }
      }
    }
    return myUser;
  }
}
