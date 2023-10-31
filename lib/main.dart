import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/widgets/landing_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Pages pages;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    pages = Pages();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.grey.shade700,
              )
            ],
          ),
          body: pages.pagesList[_selectedPage],
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
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Shop'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: 'Profile'),
            ],
          )),
    );
  }
}
