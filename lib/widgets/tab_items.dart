// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum TabItem { Home, Shop, Favorites, Bag, Profile }

class TabItemData {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  TabItemData({
    required this.title,
    required this.icon,
    required this.activeIcon,
  });
  static Map<TabItem, TabItemData> allTabs = {
    TabItem.Home: TabItemData(
      title: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    TabItem.Shop: TabItemData(
      title: 'Shop',
      icon: Icons.search_outlined,
      activeIcon: Icons.search,
    ),
    TabItem.Favorites: TabItemData(
      title: 'Fovorites',
      icon: Icons.favorite_outline,
      activeIcon: Icons.favorite,
    ),
    TabItem.Bag: TabItemData(
      title: 'Bag',
      icon: Icons.shopping_bag_outlined,
      activeIcon: Icons.shopping_bag,
    ),
    TabItem.Profile: TabItemData(
      title: 'Profile',
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person,
    ),
  };
}
