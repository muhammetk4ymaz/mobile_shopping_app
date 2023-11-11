import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/default_button.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/screens/bag/components/body.dart';
import 'package:flutter_mobile_shopping_app/screens/bag/components/check_out_bag.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
      ),
      body: Body(),
      bottomNavigationBar: CheckoutBag(),
    );
  }
}
