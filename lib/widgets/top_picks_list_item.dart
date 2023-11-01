import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/widgets/product_detail_page.dart';

class TopPicksListItem extends StatelessWidget {
  final Product product;
  final List<Product> productList;
  const TopPicksListItem(
      {required this.productList, required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                product: product,
                productList: productList,
              ),
            ));
          },
          child: Container(
            height: 210,
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.images[0]), fit: BoxFit.fill),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade300,
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          product.type,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          product.category,
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "\$" + product.price,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
