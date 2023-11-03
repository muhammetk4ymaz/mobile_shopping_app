import 'dart:convert';

class MyUser {
  final String uid;
  final String name;
  final String surname;
  final String email;
  final String password;
  MyUser({
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  MyUser copyWith({
    String? uid,
    String? name,
    String? surname,
    String? email,
    String? password,
  }) {
    return MyUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      uid: map['uid'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) =>
      MyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyUser(uid: $uid, name: $name, surname: $surname, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant MyUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.surname == surname &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
