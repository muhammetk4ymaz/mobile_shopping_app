import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';

import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:flutter_mobile_shopping_app/widgets/product_newdetail_page.dart';
import 'package:provider/provider.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final productModel = Provider.of<ProductModel>(context, listen: true);
    final productModel = Provider.of<ProductModel>(context, listen: true);
    return productModel.listFavoriteProduct.length > 0
        ? Expanded(
            child: Container(
            color: Colors.white,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productModel.listFavoriteProduct.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: getProportionateScreenWidth(3),
                  childAspectRatio:
                      SizeConfig.screenWidth! / SizeConfig.screenHeight! * 1.30,
                  crossAxisCount: 2),
              primary: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(
                                builder: (context) => ProductNewDetailPage(
                                      product: productModel.listFavoriteProduct[index],
                                      productList: productModel.listAllProduct,
                                      newProductList: productModel.listAllProduct,
                                    )));
                      },
                      child: Image.network(
                        productModel.listFavoriteProduct[index].images[0],
                        height: getProportionateScreenHeight(220),
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10),
                          horizontal: getProportionateScreenWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Best Seller',
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                productModel.listFavoriteProduct[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(10),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "\$" +
                                    productModel
                                        .listFavoriteProduct[index].price
                                        .toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              productModel.deleteFavoriteProduct(
                                  productModel.listFavoriteProduct[index]);
                            },
                            child: Icon(
                              Icons.favorite,
                              size: getProportionateScreenWidth(20),
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ))
        : Center(
            child: Text('Favorite product not found'),
          );
  }
}
