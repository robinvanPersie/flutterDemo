import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp()); //  => 是单行函数或方法的简写

class MyApp extends StatelessWidget {
  // 应用程序继承statelessWidget，使应用本身也变成一个widget, 属性不可变

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App demo generator',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

/**
 * @return 创建state类
 */
class RandomWords extends StatefulWidget {

//  @override
//  State<StatefulWidget> createState() {
//    return new RandomWordsState();
//  }
//********* 简写 ***********
  @override
  createState() => RandomWordsState();
}
/**
 * 应用程序大部分代码在该类，持有RandomWords这个widget的状态
 */
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("demo Generator"),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

// ************ 简写 ************
//  @override
//  build(BuildContext context) => Text(WordPair.random().asPascalCase);

  // 下划线开头 == private
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = Set<WordPair>();

  // 构建一个显示数据的listView
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在奇数列添加1px高的分割线
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() { // setState()会触发State对象的build(BuildContext context)方法，导致UI更新
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  // 路由新页面
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
        );
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: new Text('saved Suggestions'),
          ),
          body: new ListView(children: divided),
        );
      })
    );
  }
}