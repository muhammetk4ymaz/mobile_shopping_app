import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/icon_btn_with_counter.dart';
import 'package:flutter_mobile_shopping_app/screens/home/components/search_field.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            press: () {},
            icon: Icons.shopping_cart_outlined,
          ),
          IconBtnWithCounter(
            press: () {},
            icon: Icons.notifications_outlined,
            numOfItems: 2,
          ),
        ],
      ),
    );
  }
}
