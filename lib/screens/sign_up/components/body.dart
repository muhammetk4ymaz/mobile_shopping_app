import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/sign_up.png'),
              Positioned(
                top: getProportionateScreenHeight(60),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  child: Row(
                    children: [
                      Text(
                        'Create an \nAccaount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(25),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: getProportionateScreenHeight(125),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight! * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ),
            ],
          ),
          const SignUpForm(),
        ],
      ),
    ));
  }
}
