import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductModel extends ChangeNotifier {
  
  List<Product> _listAllProduct = [];
  List<Product> _listFavoriteProduct = [];
  List<Map<String, dynamic>> _listBagProduct = [];

  List<Map<String, dynamic>> get listBagProduct {
    return _listBagProduct;
  }

  List<Product> get listFavoriteProduct {
    return _listFavoriteProduct;
  }

  List<Product> get listAllProduct {
    return _listAllProduct;
  }

  void addBagProducts(Product product) {
    bool isContains = false;
    int? index;

    for (var element in _listBagProduct) {
      if (element.containsValue(product)) {
        isContains = true;
        index = _listBagProduct.indexOf(element);
      }
    }

    if (isContains) {
      _listBagProduct[index!].update('numberOfProduct', (value) => ++value);
    } else {
      _listBagProduct.add({
        'product': product,
        'numberOfProduct': 1,
      });
    }
    notifyListeners();
  }

  void deleteBagProducts(int index) {
    _listBagProduct.removeAt(index);
    notifyListeners();
  }

  double getTotal() {
    double total = 0.00;
    for (var element in _listBagProduct) {
      total +=
          (element['product'] as Product).price * element['numberOfProduct'];
    }
    return total;
  }

  void addFavoriteProducts(Product product) {
    if (!_listFavoriteProduct.contains(product)) {
      _listFavoriteProduct.add(product);
    }
    notifyListeners();
  }

  void deleteFavoriteProduct(Product product) {
    _listFavoriteProduct.remove(product);
    notifyListeners();
  }

  ProductModel() {
    getProducts();
  }

  Future<void> getProducts() async {
    const String _url = 'https://dummyjson.com/products';
    final response = await http.get(Uri.parse(_url));
    Map<String, dynamic> data = await json.decode(response.body);
    List mapProduct = data['products'];
    _listAllProduct = mapProduct.map((e) {
      Product product = Product.fromJson(e);
      return product;
    }).toList();
    notifyListeners();
  }
}
