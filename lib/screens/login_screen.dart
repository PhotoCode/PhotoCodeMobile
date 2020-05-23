import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';

import '../constants.dart';
import '../custom_route.dart';
import '../main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) {
    return null;
  }

  Future<String> _recoverPassword(String name) {
    return null;
  }

  String _validateEmail(String email) {
    return null;
  }

  String _validatePassword(String password) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: 'assets/images/ecorp.png',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      emailValidator: _validateEmail,
      passwordValidator: _validatePassword,
      onLogin: _loginUser,
      onSignup: _loginUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => MainScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
