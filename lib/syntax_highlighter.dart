import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rich_code_editor/exports.dart';

/// This is a dummy implementation for Syntax highlighter.
/// Ideally, you would implement the `SyntaxHighlighterBase` interface as per your need of highlighting rules.
class DummySyntaxHighlighter implements SyntaxHighlighterBase {
  @override
  TextEditingValue addTextRemotely(TextEditingValue oldValue, String newText) {
    return null;
  }

  @override
  TextEditingValue onBackSpacePress(
      TextEditingValue oldValue, TextSpan currentSpan) {
    return null;
  }

  @override
  TextEditingValue onEnterPress(TextEditingValue oldValue) {
    var padding = "";
    var newText = oldValue.text + padding;
    var newValue = oldValue.copyWith(
      text: newText,
      composing: TextRange(start: -1, end: -1),
      selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.upstream, offset: newText.length)),
    );

    return newValue;
  }

  List<TextSpan> _lsSpans = List<TextSpan>();
  final List<String> keywords =
      "in of if for while finally var new function do return void else break catch instanceof with throw case default try this switch continue typeof delete let yield const export super debugger as async await static import from as"
          .split(' ');

  @override
  List<TextSpan> parseText(TextEditingValue tev) {
    var texts = tev.text.split(' ');

    _lsSpans = List<TextSpan>();
    texts.forEach((text) {
      var comparableText = text.replaceAll(new RegExp('[\n]'),'');
      final RegExp numberRegex = RegExp(r'^-?\d+\.?\d*$');
      if (numberRegex.hasMatch(comparableText)) {
        _addColoredText(text, Colors.green);
      } else if (keywords.contains(comparableText)) {
        _addColoredText(text, Colors.red);
      } else {
        _addColoredText(text, Colors.white);
      }
      _addColoredText(' ', Colors.white);
    });
    return _lsSpans;
  }

  void _addColoredText(String text, Color color) {
    _lsSpans.add(TextSpan(text: text, style: TextStyle(color: color, fontFamily: 'RobotoMono')));
  }
}
