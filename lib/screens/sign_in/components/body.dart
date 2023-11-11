import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/social_card.dart';

import 'package:flutter_mobile_shopping_app/screens/sign_in/components/sign_form.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (SizeConfig.screenHeight! * 0.08),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Sign in with your email and password \nor continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                height: (SizeConfig.screenHeight! * 0.08),
              ),
              SignForm(),
              SizedBox(
                height: (SizeConfig.screenHeight! * 0.08),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon:
                        'https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png',
                    press: () {},
                  ),
                  SocialCard(
                    icon:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png',
                    press: () {},
                  ),
                  SocialCard(
                    icon:
                        'https://www.jckonline.com/wp-content/uploads/2023/07/X_logo_2023-300x300.jpg',
                    press: () {},
                  )
                ],
              ),
              SizedBox(
                height: (SizeConfig.screenHeight! * 0.08),
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
                      builder: (context) => SignUpScreen(),
                    )),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: Color.fromRGBO(46, 98, 188, 1)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
