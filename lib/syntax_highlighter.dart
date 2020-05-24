import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:highlight/highlight.dart' show highlight, Node;
import 'package:rich_code_editor/exports.dart';

/// This is a dummy implementation for Syntax highlighter.
/// Ideally, you would implement the `SyntaxHighlighterBase` interface as per your need of highlighting rules.
class SyntaxHighlighter implements SyntaxHighlighterBase {
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

  final List<String> keywords =
      "in of if for while finally var new function do return void else break catch instanceof with throw case default try this switch continue typeof delete let yield const export super debugger as async await static import from as"
          .split(' ');

  @override
  List<TextSpan> parseText(TextEditingValue tev) {
    var nodes = highlight.parse(tev.text, language: 'javascript').nodes;

    var theme = themeMap['solarized-dark'];
    final TextStyle globalTextStyle = TextStyle(
      fontFamily: 'RobotoMono',
    );

    List<TextSpan> spans = [];
    var currentSpans = spans;
    List<List<TextSpan>> stack = [];

    _traverse(Node node) {
      print(node.className.toString() + ' ' + node.value.toString());
      if (node.value != null) {
        currentSpans.add(node.className == null
            ? TextSpan(text: node.value, style: globalTextStyle)
            : TextSpan(
                text: node.value,
                style: theme[node.className]?.merge(globalTextStyle)));
      } else if (node.children != null) {
        List<TextSpan> tmp = [];
        currentSpans.add(TextSpan(
            children: tmp,
            style: theme[node.className]?.merge(globalTextStyle)));

        stack.add(currentSpans);
        currentSpans = tmp;

        node.children.forEach((n) {
          _traverse(n);
          if (n == node.children.last) {
            currentSpans = stack.isEmpty ? spans : stack.removeLast();
          }
        });
      }
    }

    for (var node in nodes) {
      _traverse(node);
    }

    return spans;
  }
}
