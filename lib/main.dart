import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/firebase_options.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/widgets/landing_page.dart';

import 'package:flutter_mobile_shopping_app/widgets/bottom_bar_pages.dart';
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
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
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
  late BottomBarPages bottomBarPages;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    bottomBarPages = BottomBarPages();
  }

  Future<void> _signOut() async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);

      await userModel
          .signOut()
          .whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LandingPage(),
              ),
              (route) => false));
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
          appBar: craeteAppBar(),
          body: bottomBarPages.bottomBarPagesList[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              setState(() {
                _selectedPage = value;
              });
            },
            currentIndex: _selectedPage,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.search),
                  icon: Icon(Icons.search_outlined),
                  label: 'Shop'),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                  ),
                  icon: Icon(Icons.favorite_outline),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.shopping_bag),
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Bag'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outlined),
                  label: 'Profile'),
            ],
          )),
    );
  }

  AppBar HomePageAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: Colors.grey.shade700,
        ),
        IconButton(
          onPressed: () {
            _signOut();
          },
          icon: const Icon(Icons.logout),
          color: Colors.black,
        )
      ],
    );
  }

  craeteAppBar() {
    switch (_selectedPage) {
      case 0:
        return HomePageAppBar();

      case 1:
        return HomePageAppBar();

      case 2:
        return HomePageAppBar();

      case 3:
        return HomePageAppBar();

      case 4:
        return null;
    }
  }
}
