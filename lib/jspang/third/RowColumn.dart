import 'package:flutter/material.dart';

void main() => runApp(RowApp());

class RowApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'row column',
      home: Scaffold(
        appBar: AppBar(title: Text('row and column'),),
//        body: Row(
//          children: <Widget>[
//            Expanded(child: RaisedButton(
//              onPressed: () {},
//              color: Colors.redAccent,
//              child: Text('red button'),
//            ),),
//            Expanded(child: RaisedButton(
//              onPressed: () {},
//              color: Colors.orangeAccent,
//              child: Text('orange button'),
//            ),),
//            Expanded(child: RaisedButton(
//              onPressed: () {},
//              color: Colors.lightBlue,
//              child: Text('blue button'),
//            ),),
//          ],
//        ), //body: row
//        body: ColumnWidget(),
       body: CardWidget(),
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {

  var stack = Stack(
    alignment: FractionalOffset(0.5, 0.8),
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(
          'http://blogimages.jspang.com/blogtouxiang1.jpg',),
        radius: 100.0,
      ),
      Container(
        decoration: BoxDecoration(color: Colors.lightBlue),
        padding: EdgeInsets.all(5.0),
        child: Text('ANTI-MAGE'),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        child: Text('position 1'),
      ),
      Positioned(
        bottom: 10.0,
        right: 10.0,
        child: Text('position 2'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('first'),
        Text('second'),
        Text('third'),
        stack,
      ],
    );
  }
}

// card view
class CardWidget extends StatelessWidget {

  var card = Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text('first tile', style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('first summary 12123'),
          leading: Icon(Icons.account_box),
        ),
        Divider(),
        ListTile(
          title: Text('second tile', style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('second summary 12123'),
          leading: Icon(Icons.access_time, color: Colors.lightBlue,),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return card;
  }
}