// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/screens/details/details_screen.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class ProductCad extends StatelessWidget {
  const ProductCad({
    Key? key,
    required this.productModel,
    required this.index,
    required this.category,
  }) : super(key: key);

  final ProductModel productModel;
  final int index;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final List<Product> newProductList =
            List.from(productModel.listAllProduct);
        newProductList.remove(productModel.listAllProduct[index]);
        newProductList.shuffle();
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(
            product: productModel.filterList(category)[index],
            productList: productModel.listAllProduct,
            newProductList: newProductList,
          ),
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(200),
            child: Image.network(
              productModel.filterList(category)[index].images[0],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.filterList(category)[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "\$${productModel.filterList(category)[index].price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
