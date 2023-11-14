// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';

// ignore: must_be_immutable
class ProductImages extends StatefulWidget {
  ProductImages({
    Key? key,
    required this.product,
    required this.selectedImages,
  }) : super(key: key);

  final Product product;
  int selectedImages;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(widget.product.images[widget.selectedImages]),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(15),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(widget.product.images.length,
                    (index) => buildSmallPreview(index))
              ],
            ),
          ),
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedImages = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(80),
        width: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: widget.selectedImages == index
                    ? Colors.red
                    : Colors.transparent)),
        child: Image.network(widget.product.images[index]),
      ),
    );
  }
}
