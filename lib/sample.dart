import 'package:flutter/material.dart';

void main() => runApp(new App());

/**
 * 布局单个widget.
 * 1.选择一个widget来保存对象
 * 2.创建一个widget来容纳可见对象
 */
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 创建一个text widget
    new Text('I am Text Widget', style: new TextStyle(fontSize: 32.0),);
    // 创建一个image widget
    new Image.asset('images/lake.jpeg', fit: BoxFit.cover,);
    // 创建一个icon widget
    new Icon(Icons.star, color: Colors.red[500],);

    //将text widget添加到 center widget中
    new Center(
      child: new Text('text in center', style: new TextStyle(fontSize: 32.0),),
    );
//    eg：非material应用
//    return new Container(
//      decoration: new BoxDecoration(color: Colors.greenAccent),
//      child: new Text('非Material应用，不包含appBar、标题或背景色，',
//          textDirection: TextDirection.ltr,
//          style: new TextStyle(fontSize: 23.0, color: Colors.black87)),
//
//    );
//    eg:圆角框
    return new MaterialApp(
        title: 'Round rect',
        home: new RoundRectStateFul(),
        theme: new ThemeData(
          primaryColor: Colors.white,
        )
    );
//    eg：expanded与image
//    return new MaterialApp(
//        title: 'M title',
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('app bar'),
//          ),
//          body: new Center(
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: [
//                new Expanded(flex:2, child: new Image.asset('images/lake.jpeg'),),
////                new Image.asset('images/lake.jpeg'),
//                new Expanded(child: new Image.asset('images/lake.jpeg'),),
//              ],
//            ),
//          ),
//        )
//    );
//   eg：聚集
//     return new MaterialApp(
//       title: '聚集widget: mainAxisSize',
//       home: Scaffold(
//         appBar: AppBar(title: Text('聚集'),),
//         body: new Row(
////           mainAxisSize: MainAxisSize.max,  没效果？
//           children: [
//             new Icon(Icons.star, color: Colors.green[500],),
//             new Icon(Icons.star, color: Colors.pink[500],),
//             new Icon(Icons.star, color: Colors.yellow[500],),
//             new Icon(Icons.star, color: Colors.blue[500],),
//             new Icon(Icons.star, color: Colors.grey[500],),
//           ],
//         ),
//       ),
//     );

  }
}

class RoundRectStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RoundRectState();
  }
}
/**
 * 圆角边框
 */
class RoundRectState extends State<RoundRectStateFul> {
  @override
  Widget build(BuildContext context) {
    var container = new Container(
      padding: const EdgeInsets.only(top: 100.0),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              // 1
              new Expanded(child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 10.0, color: Colors.black38),
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: new Image.asset('images/lake.jpeg'),
              ),
              ),
              // 2
              new Expanded(child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 10.0, color: Colors.black38),
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: new Image.asset('images/lake.jpeg'),
              ),
              ),
              // 3
              new Expanded(child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 10.0, color: Colors.black38),
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: new Image.asset('images/lake.jpeg'),
              ),
              ),
              // 4
              new Expanded(child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 10.0, color: Colors.black38),
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: new Image.asset('images/lake.jpeg'),
              ),
              ),
            ],
          )
        ],
      ),
    );
    return container;
  }
}
