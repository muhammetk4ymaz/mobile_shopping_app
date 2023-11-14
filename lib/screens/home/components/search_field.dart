import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';
import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15)),
        width: SizeConfig.screenWidth! * 0.6,
        decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Text('Search Product')
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    /*  final productModel = Provider.of<ProductModel>(context, listen: true);
    productModel.clearSearchProduct();
    productModel.getSearchProduct(query);
    return ListView.builder(
      itemCount: productModel.searchProduct.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(productModel.searchProduct[index].title),
      ),
    ); */
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context, listen: false);
    List<Product> matchQuery = [];
    if (query.length > 1) {
      productModel.getSearchProduct(query);
      matchQuery = productModel.searchProduct;
    }
    return matchQuery.length > 0
        ? ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(matchQuery[index].title),
            ),
          )
        : Container(
            child: Center(child: Text('ICARDIIIIIIIIIIIIIIIIIIIIIIIIIIIII')));
  }
}
