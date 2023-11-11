import 'package:flutter_mobile_shopping_app/models/my_user.dart';

abstract class UserDAO {
  Future<MyUser?> findById(String id);
  Future<List<MyUser>> findAll();
  Future<void> save(MyUser myUser);
  Future<MyUser> update(MyUser myUser, MyUser newUser);
  Future<void> delete(MyUser myUser);
}
