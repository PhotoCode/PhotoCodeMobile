import 'snippet.dart';

class Snippets {
  static List<Snippet> snippets = [
    Snippet(
      name: 'Dragon',
      code: 'function dragon()',
      imageURL: 'hi',
    ),
  ];

  static Snippet getSnippet(int index) {
    return snippets[index];
  }

  static void addSnippet(Snippet snippet) {
    snippets.add(snippet);
  }
}
