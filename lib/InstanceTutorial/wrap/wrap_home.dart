import 'package:flutter/material.dart';

class WrapHome extends StatefulWidget {

  @override
  _WrapHomeState createState() => new _WrapHomeState();
}

class _WrapHomeState extends State<WrapHome> {

  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = new List();
    list..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(title: Text('wrap 流式布局'),),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  // add btn item
  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  // photo item
  Widget buildPhoto() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}
