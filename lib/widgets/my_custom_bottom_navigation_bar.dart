import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobile_shopping_app/widgets/tab_items.dart';

class MyCustomBottomNavigationBar extends StatelessWidget {
  const MyCustomBottomNavigationBar(
      {required this.currentTab,
      required this.onSelectedTab,
      required this.bottomBarPages,
      required this.navigatorKeys,
      super.key});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> bottomBarPages;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.black,
        items: [
          _createBottomNavBarItem(TabItem.Home),
          _createBottomNavBarItem(TabItem.Shop),
          _createBottomNavBarItem(TabItem.Favorites),
          _createBottomNavBarItem(TabItem.Bag),
          _createBottomNavBarItem(TabItem.Profile),
        ],
        onTap: (value) => onSelectedTab(TabItem.values[value]),
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          navigatorKey: navigatorKeys[TabItem.values[index]],
          builder: (context) {
            return bottomBarPages.values.elementAt(index);
          },
        );
      },
    );
  }

  BottomNavigationBarItem _createBottomNavBarItem(TabItem tabItem) {
    final createTab = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(
        activeIcon: Icon(createTab!.activeIcon),
        icon: Icon(createTab.icon),
        label: createTab.title);
  }
}
