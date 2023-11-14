import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/screens/splash/components/body.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
