import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String icon;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade200, shape: BoxShape.circle),
          child: Image.network(icon),
        ),
      ),
    );
  }
}
