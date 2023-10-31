import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/widgets/bag_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/favorites_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/home_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/profile_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/shop_page.dart';

class Pages {
  final HomePage _homePage = const HomePage();
  final ShopPage _shopPage = const ShopPage();
  final BagPage _bagPage = const BagPage();
  final FavoritesPage _favoritesPage = const FavoritesPage();
  final ProfilePage _profilePage = const ProfilePage();
  List<Widget> pagesList = [];

  Pages() {
    addPage(_homePage);
    addPage(_shopPage);
    addPage(_favoritesPage);
    addPage(_bagPage);
    addPage(_profilePage);
  }

  void addPage(Widget page) {
    pagesList.add(page);
  }
}
