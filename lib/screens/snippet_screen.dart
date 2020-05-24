import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';

import '../widgets/photo_code_app_bar.dart';

class SnippetScreen extends StatelessWidget {
  final String name, code;
  final ImageProvider image;

  SnippetScreen({
    @required this.name,
    @required this.code,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PhotoCodeAppBar(showBackButton: true),
      body: Column(
        children: [
          Image(image: image),
          HighlightView(
            code,
            language: 'javascript',
            theme: githubTheme,
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              GFButton(
                onPressed: () {},
                color: GFColors.PRIMARY,
                text: "Edit",
                icon: Icon(FontAwesomeIcons.pencilAlt),
              ),
              GFButton(
                onPressed: () {},
                color: GFColors.SUCCESS,
                text: "Execute",
                icon: Icon(FontAwesomeIcons.code),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
