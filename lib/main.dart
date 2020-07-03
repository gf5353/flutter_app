// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/app/dialog.dart';
import 'package:flutter_app/app/html.dart';
import 'package:flutter_app/app/packages.dart';
import 'app/home.dart';
import 'app/widgets.dart';
import 'app/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeWidget(),
          '/widgets': (context) => MyWidget(),
          '/dialog': (context) => DialogWidget(),
          '/http': (context) => HttpWidget(),
          '/html':(context)=>HtmlWidget(),
          '/packages':(context)=>PackageWidget()
        });
  }
}

//class RandomWords extends StatefulWidget {
//  @override
//  RandomWordsState createState() => RandomWordsState();
//}
//
//class RandomWordsState extends State<RandomWords> {
//  final _suggestions = <WordPair>[];
//  final Set<WordPair> _saved = new Set<WordPair>(); // 新增本行
//  final _biggerFont = const TextStyle(fontSize: 18.0);
//
//  Widget _buildSuggestions() {
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: /*1*/ (context, i) {
//          if (i.isOdd) return Divider();
//          /*2*/
//
//          final index = i ~/ 2; /*3*/
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//          }
//          return _buildRow(_suggestions[index]);
//        });
//  }
//
//  Widget _buildRow(WordPair pair) {
//    final bool alreadySaved = _saved.contains(pair); // 新增本行
//
//    return ListTile(
//      title: Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(
//        // 新增代码开始 ...
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null,
//      ),
//      onTap: () {
//        setState(() {
//          if (alreadySaved) {
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
//      },
//    );
//  }
//
//  _pushSaved() {
//    Navigator.of(context).push(
//      new MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          final Iterable<ListTile> tiles = _saved.map(
//            (WordPair pair) {
//              return new ListTile(
//                title: new Text(
//                  pair.asPascalCase,
//                  style: _biggerFont,
//                ),
//              );
//            },
//          );
//          final List<Widget> divided = ListTile.divideTiles(
//            context: context,
//            tiles: tiles,
//          ).toList();
//
//          return new Scaffold(
//            // 新增 6 行代码开始 ...
//            appBar: new AppBar(
//              title: const Text('Saved Suggestions'),
//            ),
//            body: new ListView(children: divided),
//          ); // ... 新增代码段结束.
//        },
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Welcome to Flutter'),
//        actions: <Widget>[
//          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: Center(
//        child: _buildSuggestions(),
//      ),
//    );
//  }
//}
