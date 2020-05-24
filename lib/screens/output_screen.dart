import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OutputView extends StatefulWidget {
  final String codeToExec;

  OutputView(this.codeToExec);

  @override
  _OutputViewState createState() => _OutputViewState(codeToExec);
}

class _OutputViewState extends State<OutputView> {
  final String codeToExec;

  _OutputViewState(this.codeToExec);

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
    return Text(execOutput);
  }
}
