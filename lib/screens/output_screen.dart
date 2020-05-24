import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OutputArguments {
  final String codeToExec;
  OutputArguments(this.codeToExec);
}

class OutputView extends StatefulWidget {
  final String codeToExec;

  OutputView(this.codeToExec);

  @override
  _OutputViewState createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
  String _execOutput = "";

  Future executeCode() async {
    Dio dio = new Dio();
    var response = await dio.post(
      "https://photo-code-web.herokuapp.com/run",
      data: {
        "code": widget.codeToExec,
      },
    );
    if (this.mounted) {
      setState(() {
        _execOutput = response.data["output"].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    executeCode();
    return Text(_execOutput);
  }
}
