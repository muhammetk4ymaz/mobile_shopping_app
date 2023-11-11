import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/components/icon_btn_with_counter.dart';
import 'package:flutter_mobile_shopping_app/screens/home/components/home_header.dart';
import 'package:flutter_mobile_shopping_app/screens/home/components/search_field.dart';
import 'package:flutter_mobile_shopping_app/screens/home/components/welcome_text.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:flutter_mobile_shopping_app/widgets/product_newdetail_page.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: true);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            WelcomeText(),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Expanded(
              child: Container(
                child: productModel.listAllProduct.length > 0
                    ? GridView.builder(
                        itemCount: productModel.listAllProduct.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: getProportionateScreenWidth(3),
                            childAspectRatio: SizeConfig.screenWidth! /
                                SizeConfig.screenHeight! *
                                1.30,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              final List<Product> newProductList =
                                  List.from(productModel.listAllProduct);
                              newProductList
                                  .remove(productModel.listAllProduct[index]);
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(
                                builder: (context) => ProductNewDetailPage(
                                  product: productModel.listAllProduct[index],
                                  productList: productModel.listAllProduct,
                                  newProductList: newProductList,
                                ),
                              ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(200),
                                  child: Image.network(
                                    productModel
                                        .listAllProduct[index].images[0],
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          getProportionateScreenHeight(10),
                                      horizontal:
                                          getProportionateScreenWidth(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productModel
                                            .listAllProduct[index].category,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        productModel
                                            .listAllProduct[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "\$" +
                                            productModel
                                                .listAllProduct[index].price
                                                .toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
