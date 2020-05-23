import 'package:date_format/date_format.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class SnippetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      padding: EdgeInsets.only(top: 10),
      pinned: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return _buildSnippetRow(index);
      },
      decoration: InputDecoration.collapsed(
        hintText: 'Search...',
      ),
    );
  }

  Widget _buildSnippetRow(int index) {
    return Row(
      children: [
        _buildSnippet(index * 2),
        _buildSnippet(index * 2 + 1),
      ],
    );
  }

  Widget _buildSnippet(int index) {
    final bool isLeft = index % 2 == 0;
    final bool isTop = index < 2;

    final EdgeInsets margin = EdgeInsets.fromLTRB(
      isLeft ? 10 : 5,
      isTop ? 10 : 0,
      isLeft ? 5 : 10,
      10,
    );

    return Expanded(
      child: GFCard(
        margin: margin,
        boxFit: BoxFit.cover,
        image: Image.network(
            'https://media-exp1.licdn.com/dms/image/C4D03AQEyzcJ9UyrGtA/profile-displayphoto-shrink_200_200/0?e=1595462400&v=beta&t=E8bMsG5xP3ucJnyHJ69VdRrka2GfM-q1zBQ21bondFM'),
        content: Column(
          children: [
            Text("Dragon's Snippet"),
            Text(formatDate(
              DateTime(2020, 05, 23),
              [MM, ' ', d, ', ', yyyy, ' @ ', HH, ':', nn],
            )),
          ],
        ),
      ),
    );
  }
}
