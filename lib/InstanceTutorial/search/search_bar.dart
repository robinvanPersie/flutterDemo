import 'package:flutter/material.dart';
import 'asset_data.dart';

class SearchBar extends StatefulWidget {

  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search bar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
//              print('click search');
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          ),
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {

  // 右边 叉 
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },),
    ];
  }

  // 左边 箭头 
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        },
    );
  }

  // 搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  // 搜索 建议
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty ? recentSuggest : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestList.length,
        itemBuilder: (context, index) {
          return Center(
            child: RichText(
                text: TextSpan(
                  text: suggestList[index].substring(0, query.length),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: suggestList[index].substring(query.length), style: TextStyle(color: Colors.grey)),
                  ],
                ),
            ),
          );
        },
    );
  }
}
