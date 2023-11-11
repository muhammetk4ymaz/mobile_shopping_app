import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/screens/favorites/components/body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Favorites'),
    );
  }
}
