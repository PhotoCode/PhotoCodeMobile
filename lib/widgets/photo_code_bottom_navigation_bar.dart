import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PhotoCodeBottomNavigationBar extends StatelessWidget {
  final void Function(int) setPage;

  PhotoCodeBottomNavigationBar({@required this.setPage});

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      activeIconColor: Constants.textColor,
      circleColor: Constants.accentColor,
      inactiveIconColor: Constants.accentColor,
      barBackgroundColor: Constants.barBackgroundColor,
      textColor: Constants.accentColor,
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
      ],
      onTabChangedListener: setPage,
    );
  }
}
