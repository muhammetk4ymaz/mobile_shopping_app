import 'package:email_validator/email_validator.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/widgets/login_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email, password, confirmPassword, name, surname;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final formkey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // color: Colors.red,
              height: MediaQuery.sizeOf(context).height / 4,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Create an Account its free',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height / 2.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Name', icon: Icon(Icons.person)),
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
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Surname', icon: Icon(Icons.person)),
                          validator: (newSurname) {
                            if (newSurname!.isNotEmpty) {
                              return null;
                            } else {
                              return 'Please enter a surnaname';
                            }
                          },
                          onSaved: (newSurname) {
                            surname = newSurname;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: 'Email', icon: Icon(Icons.email)),
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
                          onSaved: (newEmail) {
                            email = newEmail;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: _password,
                          decoration: const InputDecoration(
                              labelText: 'Password', icon: Icon(Icons.lock)),
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
                          onSaved: (newValue) {
                            password = newValue;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: _confirmPassword,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              icon: Icon(Icons.lock)),
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
                        ),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          /*  debugPrint('Email: $email');
                          debugPrint('Password: $password');
                          debugPrint('Confirm Password: $confirmPassword'); */
                          _signUpWithEmailAndPassword(
                              email!, password!, name!, surname!);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: const Center(
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
