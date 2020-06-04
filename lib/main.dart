import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/screens/edit_screen.dart';

import 'constants.dart';
import 'main_screen.dart';
import 'screens/login_screen.dart';
import 'models/snippets.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );

  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoCode',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Constants.backgroundColor,
        accentColor: Constants.accentColor,
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        EditScreen.routeName: (context) => EditScreen(),
      },
    );
  }
}
