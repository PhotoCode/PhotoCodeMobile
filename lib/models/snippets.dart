import 'snippet.dart';

class Snippets {
  static List<Snippet> snippets = [
    Snippet(
      name: 'Subtraction',
      code: 'function subtract(a,b) {\n  return a-b;\n}',
      imageURL: 'https://i.ibb.co/Z1cmvYD/IMG-2068.jpg',
    ),
    Snippet(
      name: 'Promises',
      code: 'function subtract(a,b) {\n  return a-b;\n}',
      imageURL: 'https://i.ibb.co/ckLjS9t/IMG-2069.jpg',
    ),
    Snippet(
      name: 'Add',
      code: 'function add(x,y) {\n  return x+y;\n}\nconsole.log(add(1,2));',
      imageURL: 'https://i.ibb.co/3kGTMF1/IMG-2062.jpg',
    ),
    Snippet(
      name: 'Hello World',
      code: 'console.log("Hello World");',
      imageURL: 'https://i.ibb.co/chKCp2v/unknown.png',
    ),
  ];

  static getSnippet(int index) {
    return snippets[index];
  }
}
