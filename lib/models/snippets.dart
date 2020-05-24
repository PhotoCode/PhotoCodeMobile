import 'snippet.dart';

class Snippets {
  static List<Snippet> snippets = [
    Snippet(
      name: 'Dragon',
      code: 'function dragon()',
      imageURL: 'hi',
    ),
  ];

  static getSnippet(int index) {
    return snippets[index];
  }
}
