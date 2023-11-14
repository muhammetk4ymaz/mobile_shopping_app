import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/custom_soffix_icon.dart';
import 'package:flutter_mobile_shopping_app/components/default_button.dart';

import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => SignFormState();
}

class SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool remember = false;

  /* Future<void> _signInEmailAndPassword(String email, String password) async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);
      await userModel
          .signInWithEmailAndPassword(email, password)
          .whenComplete(() {
        Fluttertoast.showToast(
            msg: 'LOGIN SUCCESSFUL',
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_SHORT);
          Navigator.pop(context);
      });
    } catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
          msg: 'LOGIN UNSUCCESSFUL',
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT);
    }
  } */

  Future<void> _signInEmailAndPassword(String email, String password) async {
    try {
      MyUser? myUser;
      final userModel = Provider.of<UserModel>(context, listen: false);
      myUser = await userModel.signInWithEmailAndPassword(email, password);
      if (myUser != null) {
        Fluttertoast.showToast(
            msg: 'LOGIN SUCCESSFUL',
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_SHORT);
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(
            msg: 'Email and password are incorrect',
            backgroundColor: Colors.red,
            toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
          msg: 'LOGIN UNSUCCESSFUL',
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            children: [
              Checkbox(
                activeColor: const Color.fromRGBO(46, 98, 188, 1),
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              const Text('Remeber me'),
              const Spacer(),
              const Text(
                'Forgot Password',
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
              text: 'Sign In',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _signInEmailAndPassword(email!, password!);
                }
              },
              color: const Color.fromRGBO(46, 98, 188, 1))
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      initialValue: '9uQFF1Lh',
      // obscureText: true,
      decoration: const InputDecoration(
          labelText: 'Password',
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            icon: Icons.lock,
          )),
      onSaved: (newPassword) {
        password = newPassword;
        // debugPrint(password);
      },
      validator: (newPassword) {
        if (newPassword!.isNotEmpty) {
          return null;
        } else {
          return 'Please enter a password';
        }
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: 'atuny0@sohu.com',
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: 'Email',
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            icon: Icons.email_outlined,
          )),
      onSaved: (newEmail) {
        email = newEmail;
        // debugPrint(email);
      },
      validator: (newEmail) {
        if (newEmail!.isNotEmpty) {
          if (!EmailValidator.validate(newEmail)) {
            return 'Email is not in valid format';
          }
          return null;
        } else {
          return 'Please enter a email';
        }
      },
    );
  }
}
