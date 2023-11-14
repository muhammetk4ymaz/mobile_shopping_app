// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/icon_btn_with_counter.dart';

import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class BagItem extends StatelessWidget {
  const BagItem({
    Key? key,
    required this.product,
    required this.numberOfProduct,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int numberOfProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.network(product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        SizedBox(
          width: getProportionateScreenWidth(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                  text: "\$${product.price}",
                  style: const TextStyle(color: Colors.deepOrange),
                  children: [
                    TextSpan(
                        text: ' x$numberOfProduct',
                        style: const TextStyle(color: Colors.grey))
                  ]))
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconBtnWithCounter(
                icon: Icon(Icons.delete),
                press: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm'),
                      content: const Text(
                          'Are you sure you wish to delete this product?'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              productModel.deleteBagProducts(index);
                            },
                            child: const Text('YES')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('NO')),
                      ],
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconBtnWithCounter(
                    icon: numberOfProduct > 0
                        ? const Icon(
                            Icons.indeterminate_check_box_outlined,
                            color: Colors.red,
                          )
                        : const Icon(Icons.indeterminate_check_box_outlined),
                    press: numberOfProduct > 0
                        ? () {
                            productModel.decreaseProduct(product);
                          }
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(numberOfProduct.toString()),
                  ),
                  IconBtnWithCounter(
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.red,
                    ),
                    press: () {
                      productModel.addBagProducts(product);
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
