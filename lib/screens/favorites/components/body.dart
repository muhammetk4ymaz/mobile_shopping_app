import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/screens/favorites/components/favorite_products.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [FavoriteProducts()],
        ),
      ),
    );
  }

  Text titleText(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black87,
          fontSize: getProportionateScreenWidth(24),
          fontWeight: FontWeight.w500),
    );
  }
}
