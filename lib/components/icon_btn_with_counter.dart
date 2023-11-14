import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.icon,
    this.numOfItems = 0,
    required this.press,
  }) : super(key: key);

  final Icon icon;
  final int numOfItems;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.1),
                shape: BoxShape.circle),
            child: icon,
          ),
          if (numOfItems != 0)
            Positioned(
              right: 0,
              top: -1,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white)),
                child: Center(
                  child: Text(
                    numOfItems.toString(),
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(10),
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
