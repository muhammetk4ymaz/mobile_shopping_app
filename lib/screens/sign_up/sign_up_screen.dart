import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_up/components/body.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Body(),
    );
  }
}
