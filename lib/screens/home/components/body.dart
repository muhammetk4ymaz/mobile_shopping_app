import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/screens/home/components/home_header.dart';
import 'package:flutter_mobile_shopping_app/screens/home/components/product_card.dart';

import 'package:flutter_mobile_shopping_app/screens/home/components/welcome_text.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mobile_shopping_app/providers/product_model.dart';

import 'package:flutter_mobile_shopping_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String category = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProductModel>().getProducts();
      category = context.read<ProductModel>().categories[0].toLowerCase();
    });
  }

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
            const HomeHeader(),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            const WelcomeText(),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Categories(
              productModel: productModel,
              onSelectCategory: (selectedCategory) {
                setState(() {
                  category = selectedCategory;
                });
              },
            ),
            Expanded(
              child: Container(
                child: productModel.listAllProduct.isNotEmpty
                    ? GridView.builder(
                        itemCount: productModel.filterList(category).length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: getProportionateScreenWidth(3),
                            childAspectRatio: 0.65,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ProductCad(
                            productModel: productModel,
                            category: category,
                            index: index,
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.productModel,
    required this.onSelectCategory,
  });

  final ProductModel productModel;

  final Function(String category) onSelectCategory;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.productModel.categories.length,
        itemBuilder: (context, index) {
          return buildCategory(index);
        },
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          widget.onSelectCategory(
              widget.productModel.categories[selectedIndex].toLowerCase());
        });
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.productModel.categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.black : Colors.grey),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2,
              width: 30,
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
