import 'package:flutter/material.dart';
import 'movie/tabFilmPage.dart';
import 'movie/tabFilmSecondPage.dart';

void main() => runApp(new FilmApp());

class FilmApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'film app',
      theme: ThemeData(primaryColor: Colors.purple),
      home: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {

   @override
  State<StatefulWidget> createState() => new _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  final _pages = [MovieList(mt: 'in_theaters',), MovieListSec(mt: 'coming_soon'), MovieList(mt: 'top250')];

  void initData() {
//    _pages = [MovieList(mt: 'in_theaters',), MovieList(mt: 'coming_soon'), MovieList(mt: 'top250')];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return DefaultTabController(
        length: 3,
        initialIndex: _index,
        child: Scaffold(
          appBar: AppBar(
            title: Text('film list'),
            //标题居中
            centerTitle: false,
            //右侧菜单
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.white70,), onPressed: null,)
            ], // <widget>[]
          ), // appBar
          drawer: Drawer(
            child: ListView(children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text('antimage@gmail.com'),
                accountName: Text('antimage'),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(
                    'https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316'),),
                decoration: BoxDecoration(image: DecorationImage(
                  image: NetworkImage(
                      'http://www.liulongbin.top:3005/images/bg1.jpg'),
                  fit: BoxFit.cover,)),
              ), // UserAccountDrawerHeader
              ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback),),
              ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings),),
              ListTile(title: Text('我要发布'), trailing: Icon(Icons.send),),
              Divider(),
              ListTile(title: Text('注销'), trailing: Icon(Icons.exit_to_app),),
            ],
              padding: EdgeInsets.all(0),
            ),
          ), // drawer
          bottomNavigationBar: Container(
//            padding: EdgeInsets.only(top: 5, bottom: 0),
            height: 55,
            child: BottomNavigationBar(
                onTap: (index) {
                  onTabChecked(index);
                },
                currentIndex: _index,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(title: Text('正在热映', style: TextStyle(height: 1, fontSize: 10),), icon: Icon(Icons.movie_filter)),
                  BottomNavigationBarItem(title: Text('即将上映', style: TextStyle(height: 1, fontSize: 10),), icon: Icon(Icons.movie_creation)),
                  BottomNavigationBarItem(title: Text('Top250', style: TextStyle(height: 1, fontSize: 10),), icon: Icon(Icons.local_movies)),
                ]
            ),
          ), // bottomNavgationBar
          body: _pages.elementAt(_index), // body
        ) // scaffold
    );
  } // buildContext


  int _index = 0;

  void onTabChecked(int index) {
    setState(() {
       _index = index;
       print(_index);
    });
  }
}
