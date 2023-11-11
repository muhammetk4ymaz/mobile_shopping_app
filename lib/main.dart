import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/firebase_options.dart';
import 'package:flutter_mobile_shopping_app/providers/product_model.dart';

import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/screens/bag/bag_screen.dart';
import 'package:flutter_mobile_shopping_app/screens/favorites/favorites_screen.dart';
import 'package:flutter_mobile_shopping_app/screens/home/home_screen.dart';

import 'package:flutter_mobile_shopping_app/size_config.dart';
import 'package:flutter_mobile_shopping_app/theme.dart';

import 'package:flutter_mobile_shopping_app/widgets/landing_page.dart';

import 'package:flutter_mobile_shopping_app/widgets/my_custom_bottom_navigation_bar.dart';
import 'package:flutter_mobile_shopping_app/widgets/profile_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/shop_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/tab_items.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),

        // home: LandingPage(),
        home: LandingPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem _currentTab = TabItem.Home;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Home: GlobalKey<NavigatorState>(),
    TabItem.Shop: GlobalKey<NavigatorState>(),
    TabItem.Favorites: GlobalKey<NavigatorState>(),
    TabItem.Bag: GlobalKey<NavigatorState>(),
    TabItem.Profile: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> _bottomBarPages() {
    return {
      TabItem.Home: const HomeScreen(),
      TabItem.Shop: const ShopPage(),
      TabItem.Favorites: const FavoritesScreen(),
      TabItem.Bag: const BagScreen(),
      TabItem.Profile: const ProfilePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MyCustomBottomNavigationBar(
      bottomBarPages: _bottomBarPages(),
      currentTab: _currentTab,
      navigatorKeys: navigatorKeys,
      onSelectedTab: (value) {
        setState(() {
          _currentTab = value;
        });
      },
    );
  }
}
