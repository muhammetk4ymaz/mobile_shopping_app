import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/default_button.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class CheckoutBag extends StatelessWidget {
  const CheckoutBag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);
    debugPrint('checkout');
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30)),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15), blurRadius: 20, color: Colors.black12)
          ]),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: "Total:\n",
                      style: TextStyle(color: Colors.grey.shade600),
                      children: [
                        TextSpan(
                          text: "\$${productModel.getTotal()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ]),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                      text: 'Check Out', press: () {}, color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
