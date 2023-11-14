import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/body.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/bottom_bar.dart';
import 'package:flutter_mobile_shopping_app/screens/details/components/details_app_bar.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {required this.product,
      super.key,
      required this.productList,
      required this.newProductList});
  Product product;
  final List<Product> productList;
  List<Product> newProductList;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(product: widget.product),
      body: Body(
        product: widget.product,
        productList: widget.productList,
        onChangeProduct: (product) {
          setState(() {
            widget.product = product;
          });
        },
      ),
      bottomNavigationBar: BottomBar(product: widget.product),
    );
  }
}
