import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text('Oeschinen Lake Campground',
                  style: new TextStyle(fontWeight: FontWeight.bold),),
              ),
              new Text('Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.grey[500]),),
            ],
          )),
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('41'),
        new FavoriteWidget(),
        ],
      ),
    );

//    创建button的方法
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme
          .of(context)
          .primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(label, style: new TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, color: color,),),
          ),
        ],
      );
    }

    //三个图标
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    //文本
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      //softWrap:true 软换行符也换行（句号，逗号）
      child: new Text(
        'Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps',
        softWrap: true,),
    );

    Widget centerWidget = new Center(
      child: new Text(
        "i am in center widget", style: new TextStyle(fontSize: 32.0),),
    );

    return new MaterialApp(
      title: 'Lake App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top lake'),
        ),
//body: centerWidget,
        body: ListView(
          children: [
            //BoxFit.cover 最小边充满
            Image.asset('images/lake.jpeg', width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,),
            titleSection,
            buttonSection,
            textSection,
            centerWidget,
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
      } else {
        _favoriteCount += 1;
      }
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}