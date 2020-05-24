import 'package:flutter/material.dart';
import 'package:rich_code_editor/exports.dart';

import '../syntax_highlighter.dart';

class EditScreen extends StatelessWidget {
  static var routeName = "/edit";
  @override
  Widget build(BuildContext context) {
    return DemoCodeEditor();
  }
}

class DemoCodeEditor extends StatefulWidget {
  @override
  _DemoCodeEditorState createState() => _DemoCodeEditorState();
}

class _DemoCodeEditorState extends State<DemoCodeEditor> {
  RichCodeEditingController _rec;
  SyntaxHighlighterBase _syntaxHighlighterBase;

  @override
  void initState() {
    super.initState();
    _syntaxHighlighterBase = SyntaxHighlighter();
    _rec = RichCodeEditingController(_syntaxHighlighterBase, text: 'hi');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
