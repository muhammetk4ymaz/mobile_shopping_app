import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/widgets/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email, password, confirmPassword;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Create an Account its free',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
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
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
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
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
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
                          const SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 15),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    formkey.currentState!.save();
                                    debugPrint('Email: $email');
                                    debugPrint('Password: $password');
                                    debugPrint(
                                        'Confirm Password: $confirmPassword');
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.red.shade400,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Center(
                                      child: Text('Sign Up',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ),
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
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
