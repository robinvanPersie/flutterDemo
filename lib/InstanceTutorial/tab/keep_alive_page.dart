import 'package:flutter/material.dart';

class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => new _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> with AutomaticKeepAliveClientMixin {

  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('click to increse number'),
            Text('$_counter', style: Theme.of(context).textTheme.display1,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _increase,
          tooltip: 'increment',
          child: Icon(Icons.add),
      ),
    );
  }
}
