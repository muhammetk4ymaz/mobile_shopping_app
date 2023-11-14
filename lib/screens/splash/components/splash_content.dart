import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'EYTSHOP',
          style: TextStyle(
              color: Colors.blue.shade300,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(45)),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        Image.network(
          image,
          height: getProportionateScreenHeight(330),
          width: getProportionateScreenWidth(400),
        ),
      ],
    );
  }
}