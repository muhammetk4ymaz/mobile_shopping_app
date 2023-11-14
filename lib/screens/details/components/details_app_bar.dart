import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/icon_btn_with_counter.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class DetailsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DetailsAppBar({required this.product, super.key});
  final Product product;

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);
    isFavorite = productModel.listFavoriteProduct.contains(widget.product);
    return AppBar(
      actions: [
        IconBtnWithCounter(
          press: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
          numOfItems: productModel.listBagProduct.length,
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
          child: IconBtnWithCounter(
            icon: Icon(Icons.favorite_outline,
                color: isFavorite ? Colors.red : Colors.grey),
            press: () {
              if (!isFavorite) {
                setState(() {
                  productModel.addFavoriteProducts(widget.product);
                  isFavorite = !isFavorite;
                });
              } else {
                setState(() {
                  productModel.deleteFavoriteProduct(widget.product);
                  isFavorite = !isFavorite;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
