import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';

class UserInformationPage extends StatefulWidget {
  final MyUser myUser;
  const UserInformationPage({required this.myUser, super.key});

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text('My user information'),
        ),
        body: Container(
          // color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        initialValue:
                            widget.myUser.name + ' ' + widget.myUser.surname,
                        decoration: InputDecoration(
                            labelText: 'Name Surname',
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.person)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        initialValue: widget.myUser.email,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.email)),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
