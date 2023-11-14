import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_in/components/body.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const Body(),
    );
  }
}
