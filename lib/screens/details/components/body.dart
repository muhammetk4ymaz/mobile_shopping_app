import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/product_card.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/section_title.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/product_details.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/product_images.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Body(
      {required this.product,
      super.key,
      required this.productList,
      required this.onChangeProduct});
  Product product;
  final List<Product> productList;

  final Function(Product) onChangeProduct;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedImages = 0;
  late List<Product> newProductList;
  @override
  void initState() {
    super.initState();
    newProductList = List.from(widget.productList);
    newProductList.remove(widget.product);
    newProductList.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(
            product: widget.product,
            selectedImages: selectedImages,
          ),
          SizedBox(height: getProportionateScreenWidth(40)),
          ProductDetails(product: widget.product),
          SizedBox(height: getProportionateScreenWidth(40)),
          SectionTitle(
            text: 'Popular Products',
            press: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  newProductList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.product = newProductList[index];
                        newProductList = List.from(widget.productList);
                        newProductList.remove(widget.product);
                        newProductList.shuffle();
                        widget.onChangeProduct(widget.product);
                        selectedImages = 0;
                      });
                    },
                    child: ProductCard(
                      product: newProductList[index],
                      width: 140,
                      aspectRatio: 1.02,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
