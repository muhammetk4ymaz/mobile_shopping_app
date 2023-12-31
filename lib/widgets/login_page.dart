import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/widgets/sign_up_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  final formkey = GlobalKey<FormState>();

  Future<void> _signInEmailAndPassword(String email, String password) async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);
      await userModel
          .signInWithEmailAndPassword(email, password)
          .whenComplete(() {
        Fluttertoast.showToast(
            msg: 'LOGIN SUCCESSFUL',
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_SHORT);
      });
      /* Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
          (route) => false,
        ); */
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: const Color.fromRGBO(1, 45, 61, 1),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in to your Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Text(
                      'Welcome back! Login with your credentials',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(children: [
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: 'emregungor@hotmail.com',
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: 'Email', icon: Icon(Icons.email)),
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: '123456',
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Password', icon: Icon(Icons.lock)),
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
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                      child: const Text('Forgot Password?'),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      _signInEmailAndPassword(email!, password!);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(46, 98, 188, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Or login with',
                    style: TextStyle(color: Colors.grey.shade900),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Google'),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Facebook'),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
