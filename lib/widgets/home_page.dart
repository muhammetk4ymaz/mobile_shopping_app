import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_shopping_app/widgets/page_view_item.dart';
import 'package:flutter_mobile_shopping_app/widgets/top_picks_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            height: 260,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                TopPicksListItem(),
                SizedBox(
                  width: 10,
                ),
                TopPicksListItem(),
                SizedBox(
                  width: 10,
                ),
                TopPicksListItem(),
                SizedBox(
                  width: 10,
                ),
                TopPicksListItem(),
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
