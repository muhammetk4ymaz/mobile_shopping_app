import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/icon_btn_with_counter.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/screens/home/components/search_field.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            press: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            numOfItems: productModel.listBagProduct.length,
          ),
          IconBtnWithCounter(
            press: () {},
            icon: const Icon(Icons.notifications_outlined),
            numOfItems: 2,
          ),
        ],
      ),
    );
  }
}

