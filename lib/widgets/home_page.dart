import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/my_user.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/providers/user_model.dart';
import 'package:flutter_mobile_shopping_app/widgets/page_view_item.dart';
import 'package:flutter_mobile_shopping_app/widgets/top_picks_list_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> productList = [
    Product(products: [
      {'imagePath': 'assets/images/product1/pink.jpeg', 'price': '100'},
      {'imagePath': 'assets/images/product1/blue.jpeg', 'price': '120'},
      {'imagePath': 'assets/images/product1/yellow.jpeg', 'price': '80'}
    ], category: 'Men`s Shoes', type: 'Running Shoes'),
    Product(products: [
      {'imagePath': 'assets/images/product2/black.jpeg', 'price': '200'},
      {'imagePath': 'assets/images/product2/blue.jpeg', 'price': '240'},
      {'imagePath': 'assets/images/product2/white.jpeg', 'price': '120'}
    ], category: 'Men`s Shoes', type: 'Running Shoes'),
    Product(products: [
      {'imagePath': 'assets/images/product3/black.jpeg', 'price': '150'},
      {'imagePath': 'assets/images/product3/blue.jpeg', 'price': '120'},
      {'imagePath': 'assets/images/product3/red.jpeg', 'price': '130'}
    ], category: 'Men`s Shoes', type: 'Running Shoes'),
  ];
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.myUser != null) {
      MyUser myUser = _userModel.myUser!;
      return SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Text(
              'Good Evening, ${myUser.name}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Picks For You',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return TopPicksListItem(
                      productList: productList, product: productList[index]);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              elevation: 2,
              child: SizedBox(
                height: 110,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        _activePage = value;
                      });
                    },
                    children: const [
                      PageViewItem(),
                      PageViewItem(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            DotsIndicator(
              dotsCount: 2,
              position: _activePage,
              decorator: const DotsDecorator(
                  activeColor: Colors.black,
                  activeShape: LinearBorder(),
                  activeSize: Size(20, 3),
                  shape: LinearBorder(),
                  size: Size(20, 3)),
            )
          ],
        ),
      ));
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
