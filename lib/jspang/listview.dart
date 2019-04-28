import 'package:flutter/material.dart';

void main() => runApp(new ListViewApp(
  items:List<String>.generate(1000, (i)=>"item $i")
));

class ListViewApp extends StatelessWidget {

  final List<String> items;

  ListViewApp({Key key, @required this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listview widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('listview'),
        ),
        body: Container(
//          height: 200.0,
//          child: HorizontalList(),
//          child: ListView.builder(
//              itemCount: items.length,
//              itemBuilder: (context, index) {
//                return ListTile(title: Text('${items[index]}'),);
//              },
//          ),
            child: GridViewList(),
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
//              ListTile(
//                leading: Icon(Icons.perm_camera_mic),
//                title: Text('perm_camera_mic'),
//              ),
//              ListTile(
//                leading: Icon(Icons.add_call),
//                title: Text('add_call'),
//              ),
        Container(
          width: 180.0,
          color: Colors.lightBlue,
        ),
        Container(
          width: 180.0,
          color: Colors.redAccent,
        ),
        Container(
          width: 180.0,
          color: Colors.amber,
        ),
        Container(
          width: 180.0,
          color: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}

//grid
class GridViewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        childAspectRatio: 1.0, //宽:高
      ),
      children: [
        Image.network('http://img5.mtime.cn/mt/2018/10/17/085012.20600355_100X140X4.jpg', fit: BoxFit.cover,),
        Image.network('http://img5.mtime.cn/mt/2018/10/17/085012.20600355_100X140X4.jpg', fit: BoxFit.cover,),
        Image.network('http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg', fit: BoxFit.cover,),
      ],
    );

    return new GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 3,
        children: [
          Text('大声D'),
          Text('下属唔准波上司嘴'),
          Text('再听唔到再继续港，港到我听到为止'),
          Text('报告非凡哥'),
          Text('我系同你港道理')
        ],
    );
  }
}