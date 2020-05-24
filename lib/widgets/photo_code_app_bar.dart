import 'package:flutter/material.dart';
import 'package:flutter_login/theme.dart';
import 'package:flutter_login/widgets.dart';

import '../constants.dart';

class PhotoCodeAppBar extends StatelessWidget with PreferredSizeWidget {
  static const headerAniInterval =
      const Interval(.1, .3, curve: Curves.easeOut);

  final loadingController;

  PhotoCodeAppBar({@required this.loadingController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Hero(
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
      title: HeroText(
        Constants.appName,
        tag: Constants.titleTag,
        viewState: ViewState.shrunk,
        style: LoginThemeHelper.loginTextStyle,
        smallFontSize: 30,
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
