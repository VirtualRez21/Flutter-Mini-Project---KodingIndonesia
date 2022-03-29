import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello, 1915016048_Muchlis Mardais',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _suggestionss = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.blue);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            _suggestionss.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index], _suggestionss[index]);
        });
  }

  Widget _buildRow(WordPair pair, WordPair pairr) {
    final rng = Random();
    int min = 100, max = 999;
    int num = min + rng.nextInt(max - min);
    String tempNum = num.toString();

    return ListTile(
        trailing: Wrap(
          spacing: 12, // space between two icons
          children: <Widget>[
            Icon(Icons.call), // icon-1
            Icon(Icons.message), // icon-2
          ],
        ),
        title: Text(
          pair.asPascalCase + " a.k.a \"" + pairr.asSnakeCase + "\"",
          style: _biggerFont,
        ),
        subtitle: Text(pairr.asSnakeCase + tempNum + "@gmail.com"),
        leading: CircleAvatar(
          child: Text(pair.asPascalCase[0],
              style: TextStyle(fontSize: 20, color: Colors.amberAccent)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var today = new DateTime.now();
    var fiftyDaysFromNow = today.add(new Duration(hours: 1));
    return Scaffold(
      appBar: AppBar(
        title: Text("1915016048_Muchlis Mardais"),
        backgroundColor: Colors.orange,
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
