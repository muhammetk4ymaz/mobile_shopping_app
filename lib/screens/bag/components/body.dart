import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/screens/bag/components/bag_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile_shopping_app/components/default_button.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
            itemCount: productModel.listBagProduct.length,
            itemBuilder: (context, index) {
              Product currentProduct =
                  productModel.listBagProduct[index]['product'];
              int numberOfProduct =
                  productModel.listBagProduct[index]['numberOfProduct'];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: Key(currentProduct.id.toString()),
                    onDismissed: (direction) =>
                        productModel.deleteBagProducts(index),
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Spacer(),
                          Icon(Icons.delete_outline),
                        ],
                      ),
                    ),
                    child: BagItem(
                        product: currentProduct,
                        numberOfProduct: numberOfProduct)),
              );
            }));
  }
}
