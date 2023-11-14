import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/main.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context, listen: true);

    if (userModel.state == ViewState.Idle) {
      if (userModel.myUser == null) {
        return const SplashScreen();
      } else {
        return const MyHomePage();
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
