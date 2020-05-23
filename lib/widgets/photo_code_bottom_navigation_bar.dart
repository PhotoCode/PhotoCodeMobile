import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        TabData(iconData: FontAwesomeIcons.code, title: "Snippets"),
        TabData(iconData: Icons.camera, title: "Upload"),
        TabData(iconData: Icons.edit, title: "Edit")
      ],
      onTabChangedListener: setPage,
    );
  }
}
