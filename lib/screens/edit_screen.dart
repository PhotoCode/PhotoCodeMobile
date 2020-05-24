import 'package:flutter/material.dart';
import 'package:rich_code_editor/exports.dart';

import '../syntax_highlighter.dart';
import '../constants.dart';

class EditArguments {
  final String ocrResult;
  EditArguments(this.ocrResult);
}

class EditScreen extends StatelessWidget {
  static var routeName = "/edit";
  String ocrResult = "Error";
  @override
  Widget build(BuildContext context) {
    final EditArguments routeParams = ModalRoute.of(context).settings.arguments;
    try {
      ocrResult = routeParams.ocrResult;
    } catch (e) {
      print(e);
    }
    return DemoCodeEditor(ocrResult);
  }
}

class DemoCodeEditor extends StatefulWidget {
  final String ocrResult;
  DemoCodeEditor(this.ocrResult);
  @override
  _DemoCodeEditorState createState() => _DemoCodeEditorState(ocrResult);
}

class _DemoCodeEditorState extends State<DemoCodeEditor> {
  RichCodeEditingController _rec;
  SyntaxHighlighterBase _syntaxHighlighterBase;

  final String ocrResult;
  _DemoCodeEditorState(this.ocrResult);

  @override
  void initState() {
    super.initState();
    _syntaxHighlighterBase = SyntaxHighlighter();
    _rec = RichCodeEditingController(_syntaxHighlighterBase, text: ocrResult);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Container(
          height: 300.0,
          margin: EdgeInsets.all(24.0),
          padding: EdgeInsets.all(24.0),
          decoration: new BoxDecoration(border: new Border.all(color: Colors.grey)),
          child: RichCodeField(
            autofocus: true,
            controller: _rec,
            textCapitalization: TextCapitalization.none,
            syntaxHighlighter: _syntaxHighlighterBase,
            decoration: null,
            maxLines: null,
            onChanged: (String s) {},
            onBackSpacePress: (TextEditingValue oldValue) {},
            onEnterPress: (TextEditingValue oldValue) {
              var result = _syntaxHighlighterBase.onEnterPress(oldValue);
              if (result != null) {
                _rec.value = result;
              }
            },
          ),
        ),
      ),
    );
  }
}
