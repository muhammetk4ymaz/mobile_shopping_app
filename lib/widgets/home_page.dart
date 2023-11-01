import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/models/product.dart';
import 'package:flutter_mobile_shopping_app/widgets/page_view_item.dart';
import 'package:flutter_mobile_shopping_app/widgets/product_detail_page.dart';
import 'package:flutter_mobile_shopping_app/widgets/top_picks_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> productList = [
    Product(images: [
      'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/8df7ec66-8c54-4c9f-bb64-605b212fd34e/flex-experience-run-11-mens-running-shoes-extra-wide-2ZfRLC.png'
    ], category: 'Men`s Shoes', type: 'Running Shoes', price: '75'),
    Product(images: [
      'https://assets.adidas.com/images/w_600,f_auto,q_auto/dda507d6073c4f44abb5d314d617250e_9366/Ultra_4DFWD_Running_Shoes_Grey_ID1686_HM1.jpg'
    ], category: 'Men`s Shoes', type: 'Running Shoes', price: '100'),
  ];
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          const Text(
            'Good Evening, Muhammet',
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TopPicksListItem(
                  productList: productList,
                  product: productList[0],
                ),
                SizedBox(
                  width: 10,
                ),
                TopPicksListItem(
                  productList: productList,
                  product: productList[1],
                ),
                SizedBox(
                  width: 10,
                ),
                TopPicksListItem(
                  productList: productList,
                  product: productList[0],
                ),
                SizedBox(
                  width: 10,
                ),
                TopPicksListItem(
                  productList: productList,
                  product: productList[1],
                ),
              ],
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
  }
}
