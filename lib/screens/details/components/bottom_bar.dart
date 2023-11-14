import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({required this.product, super.key});
  final Product product;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: false);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${widget.product.price}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Free cargo',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(135),
              child: alternativeButton(
                  text: 'Buy Now',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  press: () {}),
            ),
            SizedBox(
              width: getProportionateScreenWidth(135),
              child: alternativeButton(
                  text: 'Add Bag',
                  bgColor: Colors.black,
                  textColor: Colors.white,
                  borderColor: Colors.black,
                  press: () {
                    productModel.addBagProducts(widget.product);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton alternativeButton(
      {required String text,
      required Color bgColor,
      required Color textColor,
      required Color borderColor,
      required Function() press}) {
    return ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor, side: BorderSide(color: borderColor)),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ));
  }
}
