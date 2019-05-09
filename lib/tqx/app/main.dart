import 'package:flutter/material.dart';
import '../ui/home_page.dart';
import '../ui/recommend_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tqx app',
      theme: ThemeData(primaryColor: Color(0xffffffff)),
      home: MScaffold(),
    );
  }
}

class MScaffold extends StatefulWidget {

  @override
  _MScaffoldState createState() => new _MScaffoldState();
}

class _MScaffoldState extends State<MScaffold> {

  String _title;
  final _pages = [HomePage(), RecommendPage(), HomePage()];
  int _index = 0;


  _changeBodyPageAndTitle(String title, int index) {
    setState(() {
      _title = title;
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title == null ? '商城' : _title), elevation: 0.2,),
      bottomNavigationBar: MBottomNavigation(_changeBodyPageAndTitle),
      body: _pages.elementAt(_index),
    );
  }
}

// bottom navigation
class MBottomNavigation extends StatelessWidget {

  final _changeBodyPageAndTitle;

  MBottomNavigation(this._changeBodyPageAndTitle);

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              _changeBodyPageAndTitle('商城', index);
              break;
            case 1:
              _changeBodyPageAndTitle('推荐', index);
              break;
            case 2:
              _changeBodyPageAndTitle('我的', index);
              break;
          }
          _index = index;
        },
        currentIndex: _index,
        items: buildBottomItem(),
    );
  }

  List<BottomNavigationBarItem> buildBottomItem() {
    List<BottomNavigationBarItem> list = List();
    list..add(BottomNavigationBarItem(title: Text('商城', style: TextStyle(height: 1, fontSize: 10, color: Colors.grey),), icon: Icon(Icons.store, color: Colors.grey,)))
      ..add(BottomNavigationBarItem(title: Text('推荐', style: TextStyle(height: 1, fontSize: 10),), icon: Icon(Icons.more_horiz)))
      ..add(BottomNavigationBarItem(title: Text('我的', style: TextStyle(height: 1, fontSize: 10),), icon: Icon(Icons.person)));
    return list;
  }
}



