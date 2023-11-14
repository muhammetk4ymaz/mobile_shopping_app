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
    return productModel.listBagProduct.isEmpty
        ? SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenWidth(125),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.orange,
                      size: getProportionateScreenWidth(75),
                    ),
                  ),
                  const Spacer(),
                  const Text('There are no items in your bag'),
                  const Spacer(),
                  DefaultButton(
                      text: 'Continue shopping',
                      press: () {},
                      color: Colors.black),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
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
                        resizeDuration: const Duration(seconds: 1),
                        direction: DismissDirection.endToStart,
                        key: Key(currentProduct.id.toString()),
                        confirmDismiss: (direction) {
                          return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm'),
                              content: const Text(
                                  'Are you sure you wish to delete this product?'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('YES')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text('NO')),
                              ],
                            ),
                          );
                        },
                        onDismissed: (direction) {
                          productModel.deleteBagProducts(index);
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Row(
                            children: [
                              Spacer(),
                              Icon(Icons.delete_outline),
                            ],
                          ),
                        ),
                        child: BagItem(
                            index: index,
                            product: currentProduct,
                            numberOfProduct: numberOfProduct)),
                  );
                }));
  }
}
