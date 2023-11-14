import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_mobile_shopping_app/models/product.dart';

class ProductModel extends ChangeNotifier {
  List<Product> _listAllProduct = [];
  final List<Product> _listFavoriteProduct = [];
  final List<Map<String, dynamic>> _listBagProduct = [];
  List<String> categories = [];
  List<Product> _searchProduct = [];
  bool isSearch = false;

  List<Product> filterList(String category) {
    return _listAllProduct
        .where((element) => element.category == category)
        .toList();
  }

  List<Map<String, dynamic>> get listBagProduct {
    return _listBagProduct;
  }

  List<Product> get listFavoriteProduct {
    return _listFavoriteProduct;
  }

  List<Product> get searchProduct {
    return _searchProduct;
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

  void decreaseProduct(Product product) {
    int? index;
    bool flag = false;
    for (var element in _listBagProduct) {
      if (element.containsValue(product)) {
        if (element['numberOfProduct'] > 0) {
          element.update('numberOfProduct', (value) => --value);
        } else {
          /* index = _listBagProduct.indexOf(element);
          flag = true; */
        }
      }
    }
    if (flag) {
      deleteBagProducts(index!);
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
    const String url = 'https://dummyjson.com/products';
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = await json.decode(response.body);
    List mapProduct = data['products'];
    _listAllProduct = mapProduct.map((e) {
      Product product = Product.fromJson(e);
      return product;
    }).toList();

    for (var element in _listAllProduct) {
      if (!categories.contains(element.category.toUpperCase())) {
        categories.add(element.category.toUpperCase());
      }
    }
    notifyListeners();
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return listEquals(other._listAllProduct, _listAllProduct) &&
        listEquals(other._listFavoriteProduct, _listFavoriteProduct) &&
        listEquals(other._listBagProduct, _listBagProduct) &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return _listAllProduct.hashCode ^
        _listFavoriteProduct.hashCode ^
        _listBagProduct.hashCode ^
        categories.hashCode;
  }

  Future<void> getSearchProduct(String search) async {
    String url = 'https://dummyjson.com/products/search?q=$search';
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = await json.decode(response.body);
    List mapProduct = data['products'];

    _searchProduct = mapProduct.map((e) {
      Product product = Product.fromJson(e);
      return product;
    }).toList();

    notifyListeners();
  }

  onSearch() {
    isSearch = true;
    notifyListeners();
  }

  ofSearch() {
    isSearch = false;
    notifyListeners();
  }
}
