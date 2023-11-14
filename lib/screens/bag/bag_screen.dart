import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/screens/bag/components/body.dart';
import 'package:flutter_mobile_shopping_app/screens/bag/components/check_out_bag.dart';

import 'package:provider/provider.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);
    return Scaffold(
      backgroundColor: productModel.listBagProduct.isNotEmpty
          ? Colors.white
          : Colors.grey.shade400.withOpacity(0.1),
      appBar: AppBar(
        title: const Text('My Bag'),
      ),
      body: const Body(),
      bottomNavigationBar:
          productModel.listBagProduct.isNotEmpty ? const CheckoutBag() : null,
    );
  }
}
