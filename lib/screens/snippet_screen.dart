import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'package:mobile/constants.dart';

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
    var theme = new Map<String, TextStyle>.from(themeMap['solarized-dark']);
    theme["root"] = TextStyle(backgroundColor: Constants.backgroundColor, color: Constants.textColor);
    return Scaffold(
      appBar: PhotoCodeAppBar(showBackButton: true),
      backgroundColor: Constants.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 7),
          Text(
            name,
            style: TextStyle(
              color: Constants.textColor, 
              fontSize: 25,
            ),
          ),
          Spacer(flex: 4),
          Container(
            height: 200,
            child: Image(image: image),
          ),
          HighlightView(
            code,
            language: 'javascript',
            theme: theme,
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              GFButton(
                onPressed: () {},
                color: GFColors.PRIMARY,
                text: "Edit",
                icon: Icon(FontAwesomeIcons.pencilAlt),
              ),
              Spacer(),
              GFButton(
                onPressed: () {},
                color: GFColors.SUCCESS,
                text: "Execute",
                icon: Icon(FontAwesomeIcons.code),
              ),
              Spacer(flex: 3),
            ],
          ),
          Spacer(flex: 7),
        ],
      ),
    );
  }
}
