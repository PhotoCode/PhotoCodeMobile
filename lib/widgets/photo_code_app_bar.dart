import 'package:flutter/material.dart';

import '../constants.dart';

class PhotoCodeAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool showBackButton;
  final String title;

  PhotoCodeAppBar({this.showBackButton = false, this.title = "PhotoCode"});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: this.showBackButton
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Hero(
                tag: Constants.logoTag,
                child: Image.asset(
                  'assets/images/photocode.png',
                  filterQuality: FilterQuality.high,
                  height: 10,
                  width: 10,
                ),
              ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.more_horiz, color: Constants.accentColor, size: 30),
        ),
      ],
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          color: Constants.accentColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'QuickSand',
        ),
      ),
      centerTitle: true,
      backgroundColor: Constants.barBackgroundColor,
      elevation: 0,
      textTheme: theme.accentTextTheme,
      iconTheme: theme.accentIconTheme,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
