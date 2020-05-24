import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:mobile/models/snippet.dart';
import 'package:mobile/models/snippets.dart';

import '../constants.dart';
import 'snippet_screen.dart';

class SnippetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GFSearchBar(
        searchBoxInputDecoration: InputDecoration(
          fillColor: Constants.barBackgroundColor,
          filled: true,
          hintText: "Search for snippets",
          hintStyle: TextStyle(
            color: Constants.accentColor,
          ),
        ),
        searchList: ["Dragon", "is", "a", "noob"],
        searchQueryBuilder: (query, list) {
          return list
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
        },
        overlaySearchListItemBuilder: (item) {
          return Container(
            padding: EdgeInsets.all(8),
            child: Text(
              item,
              style: TextStyle(fontSize: 18),
            ),
          );
        },
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return _buildSnippetRow(context, index);
          },
        ),
      ),
    ]);
  }

  Widget _buildSnippetRow(BuildContext context, int index) {
    return Container(
      color: Constants.backgroundColor,
      child: Row(
        children: [
          _buildSnippet(context, index * 2),
          _buildSnippet(context, index * 2 + 1),
        ],
      ),
    );
  }

  Widget _buildSnippet(BuildContext context, int index) {
    final bool isLeft = index % 2 == 0;
    final bool isTop = index < 2;

    final Snippet snippet = Snippets.getSnippet(index);

    final EdgeInsets margin = EdgeInsets.fromLTRB(
      isLeft ? 10 : 5,
      isTop ? 10 : 0,
      isLeft ? 5 : 10,
      10,
    );

    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SnippetScreen(
                name: snippet.name,
                image: NetworkImage(snippet.imageURL),
                code: snippet.code,
              ),
            ),
          );
        },
        child: GFCard(
          margin: margin,
          boxFit: BoxFit.cover,
          image: Image.network(snippet.imageURL),
          content: Column(
            children: [
              Text(snippet.name),
              Text(formatDate(
                DateTime(2020, 05, 23),
                [MM, ' ', d, ', ', yyyy, ' @ ', HH, ':', nn],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
