import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';

class SnippetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return _buildSnippet(index);
      },
      decoration: InputDecoration.collapsed(
        hintText: 'Search',
      ),
    );
  }

  Widget _buildSnippet(int index) {
    return Text('dragon');
  }
}
