import 'package:flutter/material.dart';
import 'package:mobile/screens/snippets_screen.dart';
import 'package:mobile/widgets/photo_code_app_bar.dart';

import 'constants.dart';
import 'screens/edit_screen.dart';
import 'screens/photo_screen.dart';
import 'screens/snippets_screen.dart';
import 'widgets/photo_code_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _loadingController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );
  }

  @override
  void dispose() {
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        appBar: PhotoCodeAppBar(
          loadingController: _loadingController,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: _getPage(this._currentPage),
        ),
        bottomNavigationBar: PhotoCodeBottomNavigationBar(
          setPage: (position) {
            setState(() {
              this._currentPage = position;
            });
          },
        ),
      ),
    );
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return SnippetsScreen();
      case 1:
        return PhotoScreen();
      case 2:
        return EditScreen();
    }
    return SnippetsScreen();
  }
}
