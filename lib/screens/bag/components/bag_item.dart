// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

class BagItem extends StatelessWidget {
  const BagItem({
    Key? key,
    required this.product,
    required this.numberOfProduct,
  }) : super(key: key);

  final Product product;
  final int numberOfProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.network(product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: "\$${product.price}",
                style: TextStyle(color: Colors.deepOrange),
                children: [
                  TextSpan(
                      text: ' x$numberOfProduct',
                      style: TextStyle(color: Colors.grey))
                ]))
          ],
        )
      ],
    );
  }
}
