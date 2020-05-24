import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

import '../constants.dart';

class OutputArguments {
  final String codeToExec;
  OutputArguments(this.codeToExec);
}

class OutputScreen extends StatelessWidget {
  static var routeName = "/output";
  String codeToExec = "console.log('error');";
  @override
  Widget build(BuildContext context) {
    final OutputArguments routeParams = ModalRoute.of(context).settings.arguments;
    try {
      codeToExec = routeParams.codeToExec;
    } catch (e) {
      print(e);
    }
    return _Output(codeToExec);
  }
}

class _Output extends StatefulWidget {
  final String codeToExec;
  _Output(this.codeToExec);
  @override
  _OutputState createState() => _OutputState(codeToExec);
}

class _OutputState extends State<_Output> {
  final String codeToExec;
  _OutputState(this.codeToExec);

  String execOutput = "";

  Future executeCode() async {
    Dio dio = new Dio();
    var response = await dio.post(
      "https://photo-code-web.herokuapp.com/run", 
      data: {
        "code": codeToExec,
      },
    );
    if (this.mounted) {
      setState(() {
        execOutput = response.data["output"].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    executeCode();
    return SafeArea(
      child: Scaffold(
        body: Text(execOutput),
      ),
    );
  }
}
