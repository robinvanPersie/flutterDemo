import 'package:flutter/material.dart';

/**
 * 常用布局
 */

//void main() => runApp(new GridApp());
void main() => runApp(new ListApp());
//void main() => runApp(new StackApp());

class GridApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    List<Container> _buildGridTileList(int count) {
      return new List<Container>.generate(
          count, (int index) {
            return new Container(
              decoration: new BoxDecoration(color: Colors.blueAccent),
//              child: new Icon(Icons.access_alarms),
                child: new Column(
                  children: [
                    new Icon(Icons.access_alarms),
                    new Text('item: $index'),
                  ],
                ),
            );
          }
      );
    }

    Widget buildGrid() {
      // 最大宽度150
      Widget extent = new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(30),
      );
      return extent;
    }

    MaterialApp app = new MaterialApp(
      title: 'grid ma title',
      home: Scaffold(
        appBar: AppBar(title: new Text('grid app bar'),),
        body: new Center(
          child: buildGrid(),
        )
      ),
    );

    return app;
  }
}
// *************** listView ************

class ListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      new ListTile(
        title: new Text('ListView tile', style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('i am sub title'),
        leading: new Icon(Icons.theaters, color: Colors.blue[500],),
        trailing: new Text('trailing'),
      ),

      new ListTile(
        title: new Text('tile title', style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),),
        subtitle: new Text('2nd sub'),
        leading: new Icon(Icons.theaters, color: Colors.blue[500],),
      ),
    ];
    

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: new Text('list app bar'),),
        body: new Center(
          child: new ListView(children: list,),
        )
      ),
    );
  }
}

//****************** stack and card **************
class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '看不见的title',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('stack app bar'),
        ),
        body: new StackStateful(),
      ),
      theme: new ThemeData(primaryColor: Colors.lightBlue[200]),
    );
  }
}

class StackStateful extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return new StackState();
  }
}

class StackState extends State<StackStateful> {
  
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      elevation: 20,
      child: new Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
          new CircleAvatar(
            backgroundImage: new AssetImage('images/lake.jpeg'),
            radius: 100.0,
          ),
          new Container(
            decoration: new BoxDecoration(color: Colors.black87),
            child: new Text('Mia B', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
          )
        ],
      ),
    );
//    var stack = new Stack(
//      alignment: const Alignment(0.6, 0.6),
//      children: [
//        new CircleAvatar(
//          backgroundImage: new AssetImage('images/lake.jpeg'),
//          radius: 100.0,
//        ),
//        new Container(
//          decoration: new BoxDecoration(color: Colors.black45),
//          child: new Text('Mia B', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
//        )
//      ],
//    );
    return card;
  }
}

//***************** ListTile 行级widget,用于创建包含最多3行文本和可选的行前和行尾图标的行 ***********