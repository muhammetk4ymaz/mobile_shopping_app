import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/custom_soffix_icon.dart';
import 'package:flutter_mobile_shopping_app/components/default_button.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? email, password, confirmPassword, name, surname;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  Future<void> _signUpWithEmailAndPassword(
      String email, String password, String name, String surname) async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);
      await userModel
          .signUpWithEmailAndPassword(email, password, name, surname)
          .whenComplete(
        () {
          Fluttertoast.showToast(
              msg: 'ACCOUNT CREATED',
              backgroundColor: Colors.green,
              toastLength: Toast.LENGTH_SHORT);
          Navigator.pop(context);
          /* Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          )); */
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
          msg: 'ACCOUNT UNCREATED',
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20),
            vertical: getProportionateScreenHeight(20)),
        child: Column(children: [
          buildNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildSurnameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildConfirmPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: 'Sign Up',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                /*  debugPrint('Email: $email');
                          debugPrint('Password: $password');
                          debugPrint('Confirm Password: $confirmPassword'); */
                _signUpWithEmailAndPassword(email!, password!, name!, surname!);
              }
            },
            color: Colors.red.shade400,
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                )),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: Colors.red.shade400),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Name',
        hintText: "Enter your name",
        suffixIcon: CustomSuffixIcon(icon: Icons.person_outline),
      ),
      validator: (newName) {
        if (newName!.isNotEmpty) {
          return null;
        } else {
          return 'Please enter a name';
        }
      },
      onSaved: (newName) {
        name = newName;
      },
    );
  }

  TextFormField buildSurnameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Surname',
        hintText: "Enter your surname",
        suffixIcon: CustomSuffixIcon(icon: Icons.person_outline),
      ),
      validator: (newSurnname) {
        if (newSurnname!.isNotEmpty) {
          return null;
        } else {
          return 'Please enter a surname';
        }
      },
      onSaved: (newSurname) {
        surname = newSurname;
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
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
          if (newPassword != _confirmPassword.text) {
            return 'Passwords do not match';
          }
          return null;
        } else {
          return 'Please enter a password';
        }
      },
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _confirmPassword,
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Confirm Password',
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            icon: Icons.lock,
          )),
      validator: (newPassword) {
        if (newPassword!.isNotEmpty) {
          if (newPassword != _password.text) {
            return 'Passwords do not match';
          }
          return null;
        } else {
          return 'Please enter a password';
        }
      },
      onSaved: (newValue) {
        confirmPassword = newValue;
      },
    );
  }
}
